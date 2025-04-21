#include "woody.h"

extern void             *ptr;
extern unsigned long    filelen;
extern int              fd;

/**
 * @brief This function dump the shellcode from the generated .bin in create_shellcode(...) function.
 * It takes a pointer to the shellcode_sz member of the Injection_info struct.
 *
 * @param shellcode_len
 * @return unsigned char*
 */
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
    printf(COLOR_BOLD_BLUE"0xDEAD> The shellcode is... <0xBEEF\n"COLOR_RESET);
    for (int i = 0; (unsigned long)i < *shellcode_len; i++) printf(COLOR_BOLD_WHITE"\\x%02x"COLOR_RESET,clean_shellcode[i]);
    printf("\n");
    close(shellcodefd);
    return clean_shellcode;
}

/**
 * @brief Create a shellcode generated via dprintf in the maneer of a quine program.
 * It updates the format string with difference between the old and
 * the new entrypoint of the injection program. Then it compiles the generated file with
 * nasm to output a .bin object.
 *
 * @param elf_datas
 * @param injection_infos
 * @return int
 */
int create_shellcode(ELF_datas_64 *elf_datas, Injection_infos *injection_infos)
{
    pid_t pid;
    unsigned long diff = 0;
    int sign  = 1;
    unsigned long diff_exec_seg = 0;
    int sign_exec_seg = 1;
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

    if (elf_datas->text_section_vaddr > injection_infos->shellcode_vaddr)
        diff_exec_seg = elf_datas->text_section_vaddr - injection_infos->shellcode_vaddr;
    else
    {
        diff_exec_seg = injection_infos->shellcode_vaddr - elf_datas->text_section_vaddr;
        sign_exec_seg *= -1;
    }
    printf(COLOR_BOLD_GREEN"[*] "COLOR_BOLD_WHITE"Encrypting .text section ...\n"COLOR_RESET);
    int err = rc4_cipher(elf_datas);
    if (err != SUCCESS)
        return ERROR;
    printf(COLOR_BOLD_GREEN"[*] "COLOR_BOLD_WHITE".text section with offset 0x%lx and v_addr 0x%lx encrypted !\n"COLOR_RESET, elf_datas->text_section_sh_offset, elf_datas->text_section_vaddr);
    printf(COLOR_BOLD_GREEN"[*] "COLOR_BOLD_WHITE"Generation of the assembly source file...\n"COLOR_RESET);
    dprintf(shellcode_fd, "BITS 64\nALIGN 8\nsection .text\n    global woody\nwoody:\n    sub rsp, 88\n    mov [rsp], rbx\n    mov [rsp], rcx\n    mov [rsp], rdx\n    mov [rsp], rsi\n    mov [rsp], rdi\n    mov [rsp], rbp\n    mov [rsp], r8\n    mov [rsp], r9\n    mov [rsp], r13\n    mov [rsp], r14\n    mov [rsp], r15\n    mov rdi, 1\n    lea rsi, [rel woodymsg]\n    mov rax, 1\n    mov rdx, end - woodymsg\n    syscall\n    xor rcx, rcx\n    lea rdi, [rel S]\n    lea rsi, [rel k]\ninit_loop_s:\n    mov byte [rdi + rcx], cl\n    inc rcx\n    cmp rcx, 256\n    jne init_loop_s\n    xor rcx, rcx\n    xor r8, r8\ninit_loop_j:\n    movzx rax, byte [rdi + rcx]\n    add r8, rax\n    mov r9, rcx\n    and r9, 31\n    movzx rax, byte [rsi + r9]\n    add r8, rax\n    and r8, 255\n    xor rax, rax\n    movzx r9, byte [rdi + rcx]\n    movzx rax, byte [rdi + r8]\n    mov byte [rdi + rcx], al\n    mov byte [rdi + r8], r9b\n    inc rcx\n    cmp rcx, 256\n    jne init_loop_j\n    xor rcx, rcx\n    xor r8, r8\n    xor r9, r9\n    lea rbx, [rel woody %c 0x%lx]\ndecipher:\n    inc rcx\n    and rcx, 255\n    movzx rax, byte [rdi + rcx]\n    add r8, rax\n    and r8, 255\n    xor rax, rax\n    movzx r10, byte [rdi + rcx]\n    movzx rax, byte [rdi + r8]\n    mov byte [rdi + rcx], al\n    mov byte [rdi + r8], r10b\n    xor r10, r10\n    xor rax, rax\n    movzx rax, byte [rdi + rcx]\n    add r10, rax\n    movzx rax, byte [rdi + r8]\n    add r10, rax\n    and r10, 255\n    movzx r11, byte [rdi + r10]\n    xor [rbx + r9], r11b\n    inc r9\n    cmp r9, 0x%x\n    jne decipher\n    mov r15, [rsp + 0]\n    mov r14, [rsp + 8]\n    mov r13, [rsp + 16]\n    mov r9 , [rsp + 24]\n    mov r8 , [rsp + 32]\n    mov rbp, [rsp + 40]\n    mov rdi, [rsp + 48]\n    mov rsi, [rsp + 56]\n    mov rdx, [rsp + 64]\n    mov rcx, [rsp + 72]\n    mov rbx, [rsp + 80]\n    lea r10, [rel woody %c 0x%lx]\n    jmp r10\nalign 8\n    woodymsg db '....WOODY....',0x0a,0x0\n    end db 0x0\n    k db 0x%x, 0x%x, 0x%x, 0x%x, 0x%x, 0x%x, 0x%x, 0x%x, 0x%x, 0x%x, 0x%x, 0x%x, 0x%x, 0x%x, 0x%x, 0x%x, 0x%x, 0x%x, 0x%x, 0x%x, 0x%x, 0x%x, 0x%x, 0x%x, 0x%x, 0x%x, 0x%x, 0x%x, 0x%x, 0x%x, 0x%x, 0x%x\n    S: times 256 db 0", \
        (sign_exec_seg == 1 ? '+':'-'), diff_exec_seg, elf_datas->text_section_sh_size, \
        (sign == 1 ? '+':'-'), diff, \
        elf_datas->K[0], elf_datas->K[1], elf_datas->K[2], elf_datas->K[3], elf_datas->K[4], elf_datas->K[5], elf_datas->K[6], elf_datas->K[7], elf_datas->K[8], elf_datas->K[9], elf_datas->K[10], elf_datas->K[11], elf_datas->K[12], elf_datas->K[13], elf_datas->K[14], elf_datas->K[15], elf_datas->K[16], elf_datas->K[17], elf_datas->K[18], elf_datas->K[19], elf_datas->K[20], elf_datas->K[21], elf_datas->K[22], elf_datas->K[23], elf_datas->K[24], elf_datas->K[25], elf_datas->K[26], elf_datas->K[27], elf_datas->K[28], elf_datas->K[29], elf_datas->K[30], elf_datas->K[31]);
    close(shellcode_fd);
    printf(COLOR_BOLD_GREEN"[*] "COLOR_BOLD_WHITE"We will fork() our main program to compile the assembly file into a .bin file format.\n"COLOR_RESET);
    // we are allowed to use syscalls
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

/**
 * @brief This function tries to find empty space (eg, 00 bytes) between two PT_LOAD segments
 * and populate the Injection_infos struct with the variables dumped from the segment with the
 * largest empty space. It makes the segment executable, if it was'nt.
 *
 * @param elf_datas
 * @param injection_info
 */
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
        if (curr->p_type == PT_LOAD && curr->p_flags & PF_X && curr->p_flags & PF_R)
            curr->p_flags |= PF_W;//make pt_load exec segment writable;
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
    to_inject->p_flags |= PF_R;//make the segment readable. Yes it's dirty.
    printf(COLOR_BOLD_GREEN"[*] "COLOR_BOLD_WHITE"Found the two PT_LOAD Segments with the largest size available.\n\tSize available is: %lx\n\tVirtual addr of empty space : %lx\n\tOffset where to write our shellcode : %lx\n"COLOR_RESET, \
        injection_info->cave_sz, injection_info->shellcode_vaddr, injection_info->shellcode_off);
}

/**
 * @brief This function is the main function that orchestrates the injection of the ELF file
 * It first finds the largest empty space between two PT_LOAD segments, creates the shellcode,
 * Imports it as an unsigned char * and writes it to a new ELF file with the parasite in it.
 *
 * @param elf_datas
 * @return int
 */
int inject_program_segment(ELF_datas_64 *elf_datas)
{
    int woodyfd;
    Injection_infos injection_info = {NULL, 0, 0, 0, 0};

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
    printf(COLOR_BOLD_GREEN"[*] "COLOR_BOLD_WHITE"There is sufficient space to put our shellcode.\n"COLOR_RESET);
    ((Elf64_Ehdr *)ptr)->e_entry = injection_info.shellcode_vaddr;
    printf(COLOR_BOLD_GREEN"[*] "COLOR_BOLD_WHITE"Opening the new file : woody_test\n"COLOR_RESET);
    woodyfd = open("woody_test", O_CREAT | O_RDWR | O_TRUNC, 0755);
    if (woodyfd == -1)
    {
        REEF(injection_info.shellcode);
        return print_err(0, ERROR_OPEN);
    }
    printf(COLOR_BOLD_GREEN"[*] "COLOR_BOLD_WHITE"Shellcode offset : %lx\n"COLOR_RESET, injection_info.shellcode_off);
    printf(COLOR_BOLD_GREEN"[*] "COLOR_BOLD_WHITE"Writing shellcode into mmap'ed binary file...\n"COLOR_RESET);
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
