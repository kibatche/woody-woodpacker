#include "woody.h"

extern void *ptr;
extern struct stat buf;

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
    uint16_t i = 0;
    while (i < elf_datas->nb_of_entries_section_table_64)
    {
        Elf64_Shdr *text_section = &elf_datas->shdr_64[i];
        if ((text_section->sh_size + text_section->sh_offset > (unsigned int)buf.st_size))
            return print_err(0, FILE_FORMAT_NOT_RECOGNIZED);
        if (text_section->sh_type == SHT_PROGBITS)
        {                                                                                     /*Détermine si la section de type SHT_PROGBITS est bien la section .text*/
            if (text_section->sh_flags & SHF_ALLOC && text_section->sh_flags & SHF_EXECINSTR) // man elf.h
            {
                if (text_section->sh_size == 0)
                    return print_err(0, FILE_FORMAT_NOT_RECOGNIZED);
                unsigned char *tmp = (unsigned char *)(ptr + text_section->sh_offset);
                elf_datas->text_section_instructions = malloc(text_section->sh_size);
                if (!elf_datas->text_section_instructions)
                    return print_err(0, FILE_FORMAT_NOT_RECOGNIZED);
                unsigned int j = 0;
                while (j < text_section->sh_size)
                {
                    elf_datas->text_section_instructions[j] = tmp[j];
                    printf("%02x ", elf_datas->text_section_instructions[j]);
                    if ((j + 1) % 16 == 0)
                    {
                        printf("\n");
                        fflush(NULL);
                    }
                    j++;
                }
                // void *exec = mmap(0, text_section->sh_size, PROT_READ | PROT_WRITE | PROT_EXEC, MAP_PRIVATE | MAP_ANONYMOUS, -1, 0);
                // if (exec == MAP_FAILED)
                // {
                //     printf("%s\n",strerror(errno));
                //     return EXIT_FAILURE;
                // }
                // ft_memcpy(exec, elf_datas->text_section_instructions , text_section->sh_size);
                // int (*ret)() = (int (*)())exec;
                // ret();
                break;
            }
        }
        i++;
    }
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
        else if (elf_datas->type != ET_EXEC) // nb : on ne gère pas le type core
            return print_err(0, FILE_FORMAT_NOT_RECOGNIZED);
        return 64;
    default:
        return print_err(0, FILE_FORMAT_NOT_RECOGNIZED);
    }
}
