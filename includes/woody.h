#ifndef WOODY_H
# define WOODY_H

# include <elf.h>
# include <errno.h>
# include <fcntl.h>
# include <stdio.h>
# include <stdlib.h>
# include <string.h>
# include <sys/mman.h>
# include <sys/stat.h>

# include "color.h"
# include "constants.h"
# include "libft.h"

typedef struct ELF_datas_64
{
    Elf64_Ehdr  *hdr_64;/*elf header pour les elf 64 bits */
    int         proc_bits;/*64 ou 32 bits*/
    uint16_t    type;/*LSB ou MSB*/
    uint16_t    header_size;/* taille du elf header*/
    Elf64_Addr  entry_point;
    Elf64_Shdr  *shdr_64;/*section header pour les elf 64 bits */
    Elf64_Phdr  *phdr_64; /*program header table*/
    uint64_t    offset_section_table_64;/*offset de la table des sections*/
    uint16_t    nb_of_entries_section_table_64;/*nombre d'entrées dans la table des section*/
    uint32_t    size_of_entry_section_table_64;/*taille de chaque entrée dans la table des sections*/
    unsigned char  *text_section_instructions;/*section .text de l'exécutable*/
} ELF_datas_64;

/*error handling*/
int print_err(int e, char *err_string);

/*parse elf*/
int is_valid_elf_file(ELF_datas_64 *elf_datas);
int fill_64(ELF_datas_64 *elf_datas);

/*inject elf*/
unsigned char *dump_shellcode(int *shellcode_len);
int parse_phdr(ELF_datas_64 *elf_datas);

/*misc*/
void print_woody();

#endif