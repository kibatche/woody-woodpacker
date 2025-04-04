#include <unistd.h>
int main(int argc, char **argv, char **envp) {
        execve(argv[1], &argv[1], envp);
        printf("Apres execve\n");
        return 0;
}