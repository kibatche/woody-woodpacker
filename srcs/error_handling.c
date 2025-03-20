#include "woody.h"

extern char *prg_name;

int print_err(int e, char *err_string)
{
    (void)e;
    (void)err_string;
    return EXIT_FAILURE;
}
