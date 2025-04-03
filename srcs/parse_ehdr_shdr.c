#include "woody.h"

extern void             *ptr;
extern unsigned long    filelen;
extern int              fd;

int fill_64(ELF_datas_64 *elf_datas)
{
    elf_datas->hdr_64 = (Elf64_Ehdr *)ptr;
    elf_datas->proc_bits = 64;
    elf_datas->offset_section_table_64 = elf_datas->hdr_64->e_shoff;
    elf_datas->nb_of_entries_section_table_64 = elf_datas->hdr_64->e_shnum;
    elf_datas->size_of_entry_section_table_64 = elf_datas->hdr_64->e_shentsize;
    elf_datas->type = elf_datas->hdr_64->e_type;
    elf_datas->header_size = elf_datas->hdr_64->e_ehsize;
    if (elf_datas->offset_section_table_64 > (unsigned int)filelen)
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
    if (elf_datas->offset_section_table_64 + (elf_datas->hdr_64->e_shnum * elf_datas->hdr_64->e_shentsize) > (unsigned long)filelen)
        return print_err(0, NO_SYMBOL);
    return SUCCESS;
}


int is_valid_elf_file(ELF_datas_64 *elf_datas)
{
    unsigned char *tmp = (unsigned char *)ptr; // on cast en unsigned tant qu'on ne sait si 32 ou 64 bits

    if (ft_strncmp(ELFMAG, (const char *)tmp, SELFMAG) != 0) // est-ce que les 4 premiers bytes == \177ELF ?
        return print_err(0, FILE_FORMAT_NOT_RECOGNIZED);
    if (tmp[EI_CLASS] != ELFCLASS64)
        return print_err(0, WRONG_ARCH);
    if (tmp[EI_VERSION] != EV_CURRENT)
        return print_err(0, FILE_FORMAT_NOT_RECOGNIZED);
    switch (tmp[EI_CLASS])
    {
    case ELFCLASS64:
        if (fill_64(elf_datas) == ERROR)
            return ERROR;
        if (elf_datas->header_size != 0x40)
            return print_err(0, FILE_FORMAT_NOT_RECOGNIZED);
        else if (elf_datas->type != ET_EXEC && elf_datas->type != ET_DYN)// only executable (dynamic file included) are accepted
            return print_err(0, FILE_FORMAT_NOT_RECOGNIZED);
        return 64;
    default:
        return print_err(0, FILE_FORMAT_NOT_RECOGNIZED);
    }
}






