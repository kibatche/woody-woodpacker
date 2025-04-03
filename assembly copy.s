BITS 64
section .text
    global woody
woody:
    add r12, 0x3648
    sub rsp, 32
    mov [rsp], rdi;saving register, dunno why, but push seems to mess all the calls during exec
    mov [rsp], rdx;
    mov [rsp], rsi
    mov [rsp], rdi
    mov rdi, 1;syscall 1 (write)
    lea rsi, [rel woodymsg]; load effective address, permet de load l'adresse du tableau de bytes woodymsg directement dans rsi (check syscall)
    mov rax, 1; fd 1
    mov rdx, end - woodymsg;taille
    syscall
    mov rdi, [rsp]
    mov rsi, [rsp + 8]
    mov rdx, [rsp + 16]
    mov rbx, [rsp + 24]
    jmp r12
align 8
    woodymsg db '...WOODY...',0x0a,0x0
    end db 0x0

