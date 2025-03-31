#include "woody.h"

struct stat buf;
void        *ptr;
int         fd;

int main(int ac, char **av)
{
    ELF_datas_64 elf_datas_64;
    int ret;
    int err_ret = EXIT_SUCCESS;

    if (ac != 2)
        return print_err(0, "Usage : ./woody_woodpacker program-to-backdoor");
    ft_memset(&elf_datas_64, 0, sizeof(elf_datas_64));
    fd = open(av[1],  O_RDWR);
    if (fd == -1)
        return print_err(errno, NULL);
    if (fstat(fd, &buf) == -1)
        return print_err(errno, NULL);
    ptr = mmap(0, buf.st_size, PROT_READ, MAP_PRIVATE, fd, 0);
    if (ptr == MAP_FAILED)
        return EXIT_FAILURE;
    ret = is_valid_elf_file(&elf_datas_64);
    if (ret == ERROR)
        goto FREE_AND_CLOSE;
FREE_AND_CLOSE:
    if (ret == ERROR)
        err_ret = EXIT_FAILURE;
    munmap(ptr, buf.st_size);/* on libere l'espace memoire alloue par le kernel */
    close(fd);
    exit(err_ret);
    return 0;
}