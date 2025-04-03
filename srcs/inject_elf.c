#include "woody.h"

extern void             *ptr;
extern unsigned long    filelen;
extern int              fd;

unsigned char *dump_shellcode(int *shellcode_len)
{
    int shellcodefd = open("assembly.bin", O_RDONLY);
    if (shellcodefd == -1)
    {
        print_err(0, "[!] Could not open the assembly.bin file. Did you ate it ?");
        return NULL;
    }
    int len = lseek(shellcodefd, 0, SEEK_END);
    *shellcode_len = len;
    printf(COLOR_BOLD_GREEN"[*] Shellcode size: %d\n"COLOR_RESET, *shellcode_len);
    unsigned char *clean_shellcode = malloc(len * sizeof(char));
    if (!clean_shellcode) return NULL;
    lseek(shellcodefd, 0, SEEK_SET);
    read(shellcodefd, clean_shellcode, len);
    if (!clean_shellcode) return NULL;
    printf(COLOR_BOLD_BLUE"[*] The shellcode is :\n"COLOR_RESET);
    for (int i = 0; i < len; i++) printf(COLOR_BOLD_WHITE"\\x%02x"COLOR_RESET,clean_shellcode[i]);
    printf("\n");
    close(shellcodefd);
    return clean_shellcode;
}

int parse_phdr(ELF_datas_64 *elf_datas)
{
    elf_datas->phdr_64 = (Elf64_Phdr *)(ptr + elf_datas->hdr_64->e_phoff);
    Elf64_Phdr *prev = NULL;
    Elf64_Phdr *next = NULL;
    Elf64_Addr virt_addr = 0;
    int shellcode_len = 0;
    int cy = 0;

    for (int i = 0; i< elf_datas->hdr_64->e_phnum; i++)
    {
        Elf64_Phdr *curr = &elf_datas->phdr_64[i];
        if (!cy && curr->p_type == PT_LOAD)
        {
            prev = curr;
            cy = 1;
            virt_addr = curr->p_vaddr;
            continue;
        }
        if (cy && curr->p_type == PT_LOAD)
        {
            next = curr;
            printf(COLOR_BOLD_GREEN"[*] Found 2 LOAD Segments.\n\tSize available is: %lx\n\tVirtual addr of empty space : %lx\n\tOffset where to write our shellcode : %lx\n"COLOR_RESET, \
                next->p_offset - (prev->p_offset + prev->p_memsz), virt_addr + prev->p_memsz, prev->p_offset + prev->p_filesz);
                prev->p_flags |= PF_X;//make the segment executable. Yes it's dirty.
                break;
            }
    }
    Elf64_Addr curr_ep = elf_datas->hdr_64->e_entry;
    printf(COLOR_BOLD_GREEN"[*] Current entrypoint : 0x%lx\n"COLOR_RESET, curr_ep);
    Elf64_Ehdr *hdr_64 = (Elf64_Ehdr *)ptr;
    hdr_64->e_entry = virt_addr + prev->p_memsz;
    Elf64_Addr new_ep = hdr_64->e_entry;
    int diff = 0;
    int sign  = 1;
    printf(COLOR_BOLD_GREEN"[*] New entrypoint : 0x%lx\n"COLOR_RESET, new_ep);
    if (curr_ep > new_ep){ diff = curr_ep - new_ep;} else { diff = new_ep - curr_ep; sign *= -1;}
    if (sign == 1)
        printf(COLOR_BOLD_GREEN"We will add %x to return to orignal entrypoint\n"COLOR_RESET, diff);
    else
        printf(COLOR_BOLD_GREEN"We will sub %x to return to orignal entrypoint\n"COLOR_RESET, diff);
    int filefd = open("woody_test", O_CREAT | O_RDWR | O_TRUNC, 0755);
    if (filefd == -1) return print_err(0, ERROR_OPEN);
    Elf64_Off off = prev->p_offset + prev->p_filesz;
    printf(COLOR_BOLD_GREEN"Offset : %lx\n"COLOR_RESET, off);
    unsigned char *shellcode = dump_shellcode(&shellcode_len);
    if (!shellcode) return ERROR;
    printf(COLOR_BOLD_GREEN"[*] Writing shellcode into mmap'ed binary file...\n"COLOR_RESET);
    for (int i = 0; i < shellcode_len; i++)
        ((unsigned char *)ptr + off)[i] = shellcode[i];;
    REEF(shellcode);
    printf(COLOR_BOLD_GREEN"[*] Done\n"COLOR_RESET);
    lseek(filefd, 0, SEEK_SET);
    printf(COLOR_BOLD_GREEN"[*] Writing mmap'ed and shellcoded file to new file woody...\n"COLOR_RESET);
    write(filefd, ptr, filelen);
    close(filefd);
    printf(COLOR_BOLD_GREEN"[*] Done !\n"COLOR_RESET);
    return SUCCESS;
}