#include "woody.h"

extern char *prg_name;

int print_err(int e, char *err_string)
{
    (void)e;
    dprintf(2, COLOR_BOLD_RED"%s\n"COLOR_RESET, err_string);
    return ERROR;
}
