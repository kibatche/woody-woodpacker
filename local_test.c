# include <elf.h>
# include <errno.h>
# include <fcntl.h>
# include <stdio.h>
# include <stdlib.h>
# include <string.h>
# include <sys/mman.h>
# include <sys/stat.h>


int main(int ac, char **av)
{
    int fd;

    Elf64_Ehdr ehdr;
    struct stat buf;
    fstat(fd, &buf);
    fd = open(av[1],  O_RDWR);
    void *ptr = mmap(0, buf.st_size, PROT_READ, MAP_PRIVATE, fd, 0);
    Elf64_Phdr *phdr_64 = (Elf64_Phdr *)(ptr + ehdr.e_phoff);
    Elf64_Phdr *prev = NULL;
    Elf64_Phdr *next = NULL;
    Elf64_Addr virt_addr = 0;
    int cy = 0;
    for (int i=0; i< ehdr.e_phnum; i++)
    {
        Elf64_Phdr *curr = phdr_64;
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
            printf("Found 2 LOAD Segments. Size between them is : %lx - (%lx + %lx) = %lx\nVirtual addr of empty space : %lx\n", \
                    next->p_offset, prev->p_offset, prev->p_memsz, \
                    next->p_offset - (prev->p_offset + prev->p_memsz), virt_addr + prev->p_memsz + 1);
            prev = next;
            continue;
        }
    }

    read(fd, &ehdr, sizeof(ehdr));
    printf("0x%lx\n", ehdr.e_entry);
    ehdr.e_entry = 0x629;
    lseek(fd, 0, SEEK_SET);
    write(fd, &ehdr, sizeof(ehdr));
    munmap(ptr, buf.st_size);/* on libere l'espace memoire alloue par le kernel */
    close(fd);
}