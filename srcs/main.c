#include "woody.h"

unsigned long   filelen;
void            *ptr;
int             fd;

int main(int ac, char **av)
{
    ELF_datas_64 elf_datas_64;
    int ret;
    int err_ret = EXIT_SUCCESS;

    print_woody();
    if (ac != 2)
        return print_err(0, USAGE);
    ft_memset(&elf_datas_64, 0, sizeof(elf_datas_64));
    fd = open(av[1],  O_RDWR);
    if (fd == -1)
        return print_err(errno, ERROR_OPEN);
    filelen = lseek(fd, 0, SEEK_END);//needed to know the size of the binary 'cause we can't use fstat (EDIT : that's wrong, fstat is a syscall.)
    lseek(fd, 0, SEEK_SET);//reset the pointer to the beginning of the file
    ptr = mmap(0, filelen, PROT_READ | PROT_EXEC | PROT_WRITE, MAP_PRIVATE, fd, 0);
    if (ptr == MAP_FAILED)
        return print_err(0, MMAP_FAILED);
    ret = is_valid_elf_file(&elf_datas_64);
    if (ret == ERROR)
        goto FREE_AND_CLOSE;
    ret = inject_program_segment(&elf_datas_64);
FREE_AND_CLOSE:
    if (ret == ERROR)
        err_ret = EXIT_FAILURE;
    munmap(ptr, filelen);/* free space */
    close(fd);
    exit(err_ret);
}