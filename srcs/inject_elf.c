#include "woody.h"

extern void             *ptr;
extern unsigned long    filelen;
extern int              fd;

unsigned char *dump_shellcode(unsigned long *shellcode_len)
{
    int shellcodefd = open("./bin/shellcode.bin", O_RDONLY);
    if (shellcodefd == -1)
    {
        print_err(0, "[!] Could not open the sellcode.bin file. Did you ate it ?");
        return NULL;
    }
    *shellcode_len = lseek(shellcodefd, 0, SEEK_END);
    printf(COLOR_BOLD_GREEN"[*] "COLOR_BOLD_WHITE"Shellcode size: %lu\n"COLOR_RESET, *shellcode_len);
    unsigned char *clean_shellcode = malloc(*shellcode_len * sizeof(char));
    if (!clean_shellcode) return NULL;
    lseek(shellcodefd, 0, SEEK_SET);
    read(shellcodefd, clean_shellcode, *shellcode_len);
    if (!clean_shellcode) return NULL;
    printf(COLOR_BOLD_BLUE"0xDEAD> The shellcode is... <0XBEEF\n"COLOR_RESET);
    for (int i = 0; (unsigned long)i < *shellcode_len; i++) printf(COLOR_BOLD_WHITE"\\x%02x"COLOR_RESET,clean_shellcode[i]);
    printf("\n");
    close(shellcodefd);
    return clean_shellcode;
}

int create_shellcode(ELF_datas_64 *elf_datas, Injection_infos *injection_infos)
{
    pid_t pid;
    unsigned long diff = 0;
    int sign  = 1;
    int shellcode_fd = open("./srcs_assembly/shellcode.s", O_CREAT | O_RDWR | O_TRUNC, 0755);
    if (shellcode_fd == -1)
        return print_err(0, ERROR_OPEN);
    printf(COLOR_BOLD_GREEN"[*] "COLOR_BOLD_WHITE"We will test if the shellcode can fit in the found cave. Processing...\n"COLOR_RESET);
    printf(COLOR_BOLD_GREEN"[*] "COLOR_BOLD_WHITE"Current entrypoint : 0x%lx\n"COLOR_RESET, elf_datas->hdr_64->e_entry);
    printf(COLOR_BOLD_GREEN"[*] "COLOR_BOLD_WHITE"New entrypoint : 0x%lx\n"COLOR_RESET, injection_infos->shellcode_vaddr);
    if (elf_datas->hdr_64->e_entry > injection_infos->shellcode_vaddr)
        diff = elf_datas->hdr_64->e_entry - injection_infos->shellcode_vaddr;
    else
    {
        diff = injection_infos->shellcode_vaddr - elf_datas->hdr_64->e_entry;
        sign *= -1;
    }
    if (sign == 1)
        printf(COLOR_BOLD_GREEN"[*] "COLOR_BOLD_WHITE"We will add %lx to return to orignal entrypoint\n"COLOR_RESET, diff);
    else
        printf(COLOR_BOLD_GREEN"[*] "COLOR_BOLD_WHITE"We will sub %lx to return to orignal entrypoint\n"COLOR_RESET, diff);
    printf(COLOR_BOLD_GREEN"[*] "COLOR_BOLD_WHITE"Generation of the assembly source file...\n"COLOR_RESET);
    dprintf(shellcode_fd, "BITS 64\nALIGN 8\nsection .text\n    global woody\nwoody:\n    sub rsp, 88\n    mov [rsp], rbx  \n    mov [rsp], rcx  \n    mov [rsp], rdx  \n    mov [rsp], rsi  \n    mov [rsp], rdi  \n    mov [rsp], rbp  \n    mov [rsp], r8  \n    mov [rsp], r9   \n    mov [rsp], r13  \n    mov [rsp], r14  \n    mov [rsp], r15  \n    mov rdi, 1\n    lea rsi, [rel woodymsg]\n    mov rax, 1\n    mov rdx, end - woodymsg\n    syscall\n    mov r15, [rsp + 0]  \n    mov r14, [rsp + 8]  \n    mov r13, [rsp + 16]  \n    mov r9 , [rsp + 24]  \n    mov r8 , [rsp + 32]  \n    mov rbp, [rsp + 40]  \n    mov rdi, [rsp + 48]  \n    mov rsi, [rsp + 56]  \n    mov rdx, [rsp + 64]  \n    mov rcx, [rsp + 72]  \n    mov rbx, [rsp + 80]\n    lea r10, [rel woody %c 0x%lx]\n    jmp r10\nalign 8\n    woodymsg db '....WOODY....',0x0a,0x0\n    end db 0x0", \
    (sign == 1 ? '+':'-'), diff);
    close(shellcode_fd);
    printf(COLOR_BOLD_GREEN"[*] "COLOR_BOLD_WHITE"We will fork() our main program to compile the assembly file into a .bin file format.\n"COLOR_RESET);
    ;// we are allowed to use syscalls
    if ((pid = fork()) == 0)//child
    {
        char *const arg[] = {"nasm","-f", "bin", "-o", "./bin/shellcode.bin", "./srcs_assembly/shellcode.s", NULL};
        char *const envp[] = {NULL};
        if (execve("/usr/bin/nasm", arg, envp) == -1)
            return print_err(0, "execve failed.");
    }
    else if (pid > 0)//parent
    {
        int status;
        waitpid(pid, &status, 0);
        if (WIFEXITED(status))
        {
            if (WEXITSTATUS(status) == 0)
                printf(COLOR_BOLD_GREEN"[*] "COLOR_BOLD_WHITE"nasm compilation OK !\n"COLOR_RESET);
            else
                return print_err(0, "nasm compilation failed");
        }
        else
            return print_err(0,"nasm with execve failed.");
    }
    else
        return print_err(0, "fork failed.");
    return SUCCESS;
}

void find_cave(ELF_datas_64 *elf_datas, Injection_infos *injection_info)
{
    int state = 0;
    Elf64_Phdr *prev = NULL;
    Elf64_Phdr *next = NULL;
    unsigned long max = 0;
    Elf64_Phdr *to_inject = NULL;
    Elf64_Phdr *next_struct = NULL;
    
    for (int i = 0; i < elf_datas->hdr_64->e_phnum; i++)
    {
        Elf64_Phdr *curr = &elf_datas->phdr_64[i];
        if (!state && curr->p_type == PT_LOAD)
        {
            prev = curr;
            state = 1;
            continue;
        }
        if (state && curr->p_type == PT_LOAD)
        {
            next = curr;
            if ((next->p_offset - (prev->p_offset + prev->p_memsz)) > max)
            {
                max = next->p_offset - (prev->p_offset + prev->p_memsz);
                to_inject = prev;
                next_struct = next;
            }
            prev = next;
            continue;
        }
    }
    injection_info->cave_sz = next_struct->p_offset - (to_inject->p_offset + to_inject->p_memsz);
    injection_info->shellcode_vaddr = to_inject->p_vaddr + to_inject->p_memsz ;
    injection_info->shellcode_off = to_inject->p_offset + to_inject->p_filesz;
    to_inject->p_flags |= PF_X;//make the segment executable. Yes it's dirty.
    printf(COLOR_BOLD_GREEN"[*] "COLOR_BOLD_WHITE"Found the two PT_LOAD Segments with the largest size available.\n\tSize available is: %lx\n\tVirtual addr of empty space : %lx\n\tOffset where to write our shellcode : %lx\n"COLOR_RESET, \
        injection_info->cave_sz, injection_info->shellcode_vaddr, injection_info->shellcode_off);
}

int inject_program_segment(ELF_datas_64 *elf_datas)
{
    int woodyfd;
    Injection_infos injection_info = {NULL, 0, 0, 0, 0};

    elf_datas->phdr_64 = (Elf64_Phdr *)(ptr + elf_datas->hdr_64->e_phoff);
    find_cave(elf_datas, &injection_info);
    if (create_shellcode(elf_datas, &injection_info) == ERROR)
        return ERROR;
    injection_info.shellcode = dump_shellcode(&injection_info.shellcode_sz);
    if (!injection_info.shellcode)
        return ERROR;
    if (injection_info.shellcode_sz > injection_info.cave_sz)
    {
        REEF(injection_info.shellcode);
        return print_err(0, "No sufficient space inside the binary. Try another one.");
    }
    printf(COLOR_BOLD_GREEN"[*] "COLOR_BOLD_WHITE"There is sufficient space to fit our shellcode.\n"COLOR_RESET);
    Elf64_Ehdr *hdr_64 = (Elf64_Ehdr *)ptr;
    hdr_64->e_entry = injection_info.shellcode_vaddr;
    printf(COLOR_BOLD_GREEN"[*] "COLOR_BOLD_WHITE"Opening the new file : woody_test\n"COLOR_RESET);
    woodyfd = open("woody_test", O_CREAT | O_RDWR | O_TRUNC, 0755);
    if (woodyfd == -1)
    {
        REEF(injection_info.shellcode);
        return print_err(0, ERROR_OPEN);
    }
    printf(COLOR_BOLD_GREEN"[*] "COLOR_BOLD_WHITE"Shellcode offset : %lx\n"COLOR_RESET, injection_info.shellcode_off);
    printf(COLOR_BOLD_GREEN"[*] "COLOR_BOLD_WHITE"Writing shellcode into mmap'ed binary file...\n"COLOR_RESET);
    // for (int i = 0; i < shellcode_len; i++)
    //     ((unsigned char *)ptr + shellcode_off)[i] = shellcode[i];
    ft_memcpy(((unsigned char *)ptr + injection_info.shellcode_off), injection_info.shellcode, injection_info.shellcode_sz);
    REEF(injection_info.shellcode);
    printf(COLOR_BOLD_GREEN"[*] "COLOR_BOLD_WHITE"Shellcode written to the mmap'ed file !\n"COLOR_RESET);
    lseek(woodyfd, 0, SEEK_SET);
    printf(COLOR_BOLD_GREEN"[*] "COLOR_BOLD_WHITE"Writing mmap'ed and shellcoded file to the new file woody_test...\n"COLOR_RESET);
    write(woodyfd, ptr, filelen);
    close(woodyfd);
    printf(COLOR_BOLD_GREEN"[*] "COLOR_BOLD_WHITE"Done ! You can try if everything worked as expected.\n"COLOR_RESET);
    return SUCCESS;
}