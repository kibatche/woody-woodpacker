#include "woody.h"

extern void         *ptr;
extern struct stat  buf;
extern int          fd;

int fill_64(ELF_datas_64 *elf_datas)
{
    elf_datas->hdr_64 = (Elf64_Ehdr *)ptr;
    elf_datas->proc_bits = 64;
    elf_datas->offset_section_table_64 = elf_datas->hdr_64->e_shoff;
    elf_datas->nb_of_entries_section_table_64 = elf_datas->hdr_64->e_shnum;
    elf_datas->size_of_entry_section_table_64 = elf_datas->hdr_64->e_shentsize;
    elf_datas->type = elf_datas->hdr_64->e_type;
    elf_datas->header_size = elf_datas->hdr_64->e_ehsize;
    if (elf_datas->offset_section_table_64 > (unsigned int)buf.st_size)
        return print_err(0, FILE_FORMAT_NOT_RECOGNIZED);
    if ((elf_datas->hdr_64->e_shstrndx) > (elf_datas->hdr_64->e_shnum))
        return print_err(0, FILE_FORMAT_NOT_RECOGNIZED);
    elf_datas->shdr_64 = (Elf64_Shdr *)(ptr + elf_datas->offset_section_table_64);
    if (elf_datas->nb_of_entries_section_table_64 == 0) // check si nb entry > SHN_LORESERVE (0xff00)
    {
        if (elf_datas->shdr_64->sh_size != 0)
            elf_datas->nb_of_entries_section_table_64 = elf_datas->hdr_64->e_shnum;
        else
            return print_err(0, FILE_FORMAT_NOT_RECOGNIZED);
    }
    if (elf_datas->offset_section_table_64 + (elf_datas->hdr_64->e_shnum * elf_datas->hdr_64->e_shentsize) > (unsigned long)buf.st_size)
        return print_err(0, NO_SYMBOL);

    elf_datas->phdr_64 = (Elf64_Phdr *)(ptr + elf_datas->hdr_64->e_phoff);
    Elf64_Phdr *prev = NULL;
    Elf64_Phdr *next = NULL;
    Elf64_Addr virt_addr = 0;
    int cy = 0;
    for (int i=0; i< elf_datas->hdr_64->e_phnum; i++)
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
            printf("Found 2 LOAD Segments. Size between them is : %lx - (%lx + %lx) = %lx\nVirtual addr of empty space : %lx\n \
Offset where to write our shellcode : %lx\n", \
                    next->p_offset, prev->p_offset, prev->p_memsz, \
                    next->p_offset - (prev->p_offset + prev->p_memsz), virt_addr + prev->p_memsz, prev->p_offset + prev->p_filesz);
            prev->p_flags |= PF_X;
            curr->p_flags |= PF_X;
                    break;
        }
    }
    printf("Current entrypoint : %lx\n",elf_datas->hdr_64->e_entry);
    Elf64_Ehdr *hdr_64 = (Elf64_Ehdr *)ptr;
    hdr_64->e_entry = virt_addr + prev->p_memsz;
    printf("New entrypoint : 0x%lx\n", hdr_64->e_entry);
    int filefd = open("woody_test", O_CREAT | O_RDWR | O_TRUNC, 0755);
    int shellcodefd = open("assembly.bin", O_RDONLY);
    int len = lseek(shellcodefd, 0, SEEK_END);
    printf("Shellcode size : %d\n", len);
    unsigned char *tmp = malloc(len * sizeof(char));
    lseek(shellcodefd, 0, SEEK_SET);
    read(shellcodefd, tmp, len);
    Elf64_Off off = prev->p_offset + prev->p_filesz;
    printf("Offset : %lx\n", off);
    printf("Writing shellcode\n");
    for (int j = 0; j < len; j++) {
        // if (tmp[j] == 0x0)
        //     continue;
        printf("\\x%02x",tmp[j]);
        ((unsigned char *)ptr + off)[j] = tmp[j];
    }
    fflush(0x0);
    lseek(filefd, 0, SEEK_SET);
    write(filefd, ptr, buf.st_size);
    close(filefd);
    return SUCCESS;
}

int is_valid_elf_file(ELF_datas_64 *elf_datas)
{
    unsigned char *tmp = (unsigned char *)ptr; // on cast en unsigned tant qu'on ne sait si 32 ou 64 bits

    if (ft_strncmp(ELFMAG, (const char *)tmp, SELFMAG) != 0) // est-ce que les 4 premiers bytes == \177ELF ?
        return print_err(0, FILE_FORMAT_NOT_RECOGNIZED);
    if (tmp[EI_CLASS] != ELFCLASS64)
        return print_err(0, FILE_FORMAT_NOT_RECOGNIZED);
    if (tmp[EI_VERSION] != EV_CURRENT)
        return print_err(0, FILE_FORMAT_NOT_RECOGNIZED);
    switch (tmp[EI_CLASS])
    {
    case ELFCLASS64:
        if (fill_64(elf_datas) == ERROR)
            return ERROR;
        if (elf_datas->header_size != 0x40)
            return print_err(0, FILE_FORMAT_NOT_RECOGNIZED);
        else if (elf_datas->type != ET_EXEC && elf_datas->type != ET_DYN) // nb : on ne gère pas le type core
            return print_err(0, FILE_FORMAT_NOT_RECOGNIZED);
        return 64;
    default:
        return print_err(0, FILE_FORMAT_NOT_RECOGNIZED);
    }
}






