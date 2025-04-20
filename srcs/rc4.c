#include "woody.h"

extern void     *ptr;
extern unsigned long   filelen;

int rc4_cipher(ELF_datas_64 *elf_datas)
{
    int S[256];//init tab
    unsigned char K[32]= {0x3e, 0xf0, 0x87, 0x16, 0x68, 0x5e, 0x8a, 0x95, 0x0e, 0xc7, 0x7e, 0x18, 0xdb, 0x3e, 0x1b, 0x21, 0xf5, 0xd0, 0x13, 0x8e, 0x26, 0x3f, 0xbc, 0x0f, 0xd0, 0xf4, 0xa1, 0xb4, 0xa5, 0x10, 0x3a, 0x68};// key
    // int dev_urandom_fd;

(void)elf_datas;

    for (int i = 0; i < 256; i++)
        S[i] = i;
    // dev_urandom_fd = open("/dev/urandom", O_RDONLY);
    // if (dev_urandom_fd == -1)
    //     return print_err(0, ERROR_OPEN);
    // int r = read(dev_urandom_fd, K, 32);
    // if (r == -1)
    //     return print_err(0, "[!] read failed to read /dev/urandom.");
    // close(dev_urandom_fd);
    // printf("Key :\n");
    // for (int i = 0; i < 32; i++)
    //     printf("0x%02x, ", K[i]);
    // printf("\n");
    int j = 0;
    for (int i = 0; i < 256; i++)
    {
        j = j + S[i];
        j = j + K[i % 32];
        j = j % 256;
        unsigned char tmp = S[i];
        unsigned char tmp2 = S[j];
        printf("[%d] tmp 0x%2x, tmp2 0x%2x\n", i, tmp, tmp2);
        S[i] = S[j];
        S[j] = tmp;
        printf("[%d] tmp 0x%2x, tmp2 0x%2x\n", i,tmp, tmp2);
        // if (i < 3)
        //     printf("\nS[] at i = %d\n", i);
        // for (int ind = 0; ind < 256 && i < 3; ind++)
        // {
        //     printf("0x%02x, ", S[ind]);
        //     if (ind%15 == 0 && ind)
        //         printf("\n");
        // }
    }
    unsigned char text[17] = {0x9f, 0x65, 0x8b, 0xb4, 0xff, 0x1e, 0x2a, 0xe8, 0x40, 0x14, 0xad, 0x8a, 0x1a, 0x6d, 0xb8, 0xa3, 0x04} ;
    printf("Chiphered text\n");
    for (int i = 0, j = 0, k = 0; k < 17; k++)
    {
        // printf("\nS[] at k = %d\n", k);
        // for (int ind = 0; ind < 256; ind++)
        // {
        //     printf("0x%02x, ", S[ind]);
        //     if (ind%15 == 0 && ind)
        //         printf("\n");
        // }
        // printf("\n");
        i = (i + 1);
        i = i % 256;
        j = (j + S[i]);
        j = j % 256;
        unsigned char tmp = S[i];
        unsigned char tmp2 = S[j];
        printf("tmp 0x%2x, tmp2 0x%2x\n", tmp, tmp2);
        S[i] = S[j];
        S[j] = tmp;
        unsigned char xorkeyint = S[i];
        // printf("0x%2x\n", xorkeyint);
        xorkeyint = xorkeyint + S[j];
        xorkeyint = xorkeyint % 256;
        xorkeyint = S[xorkeyint];
        text[k] = text[k] ^ xorkeyint;
        unsigned char tmp3 = text[k];
        // text[k] ^= S[(S[i] + S[j]) % 256];
        printf("%c", (unsigned char)text[k]);
        // printf("0x%02x\n", (unsigned char)text[k]);
        // printf("%c\n", (text[k] ^ key_xor));
        if (i == 3)
            break;
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