#include "woody.h"

extern void     *ptr;
extern unsigned long   filelen;

int rc4_cipher(ELF_datas_64 *elf_datas)
{
    int S[256];//init tab
    unsigned char K[32];// key
    int dev_urandom_fd;

(void)elf_datas;

    for (int i = 0; i < 256; i++)
        S[i] = i;
    dev_urandom_fd = open("/dev/urandom", O_RDONLY);
    if (dev_urandom_fd == -1)
        return print_err(0, ERROR_OPEN);
    int r = read(dev_urandom_fd, K, 32);
    if (r == -1)
        return print_err(0, "[!] read failed to read /dev/urandom.");
    close(dev_urandom_fd);
    for (int i = 0; i < 32; i++)
        printf("0x%02x, ", K[i]);
    printf("\n");
    int j = 0;
    for (int i = 0; i < 256; i++)
    {
        j = (j + S[i] + K[i % 32]) % 256;
        unsigned char tmp = S[i];
        S[i] = S[j];
        S[j] = tmp;
    }
    char text[17] = "this is a secret";
    for (int i, j, k = 0; k < 17; k++)
    {
        i = (i + 1) % 256;
        j = (j + S[i]) % 256;
        unsigned char tmp = S[i];
        S[i] = S[j];
        S[j] = tmp;
        unsigned char key_xor = S[(S[i] + S[j]) % 256];
        text[k] ^= key_xor;
        printf("%02x, ", text[k]);
        // printf("%c", text[k] ^ key_xor);
    }
    printf("\n");
    return SUCCESS;
}

// int lz77(ELF_datas_64 *elf_datas)
// {
//     char *t = "xyxyzxyxyzyz";

//     char past[13];
//     char *curr = t;

//     char res[256] = {0};
//     int i = 0;
//     while (curr)
//     {
//         if (past[0] = 0)
//         {
//             printf("%d %d %c\n", 0, 0, *curr);
//             res[i++] = *curr++;
//             continue;
//         }
//     }
// }