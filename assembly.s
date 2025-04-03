BITS 64
section .text
    global woody
woody:
    sub rsp, 72
    mov [rsp], rbx
    mov [rsp], rcx
    mov [rsp], rdx
    mov [rsp], rsi
    mov [rsp], rdi
    mov [rsp], rbp
    mov [rsp], r13
    mov [rsp], r14
    mov [rsp], r15
    mov rdi, 1;syscall 1 (write)
    lea rsi, [rel woodymsg]; load effective address, permet de load l'adresse du tableau de bytes woodymsg directement dans rsi (check syscall)
    mov rax, 1; fd 1
    mov rdx, end - woodymsg;taille
    syscall
    mov r15, [rsp + 0]
    mov r14, [rsp + 8]
    mov r13, [rsp + 16]
    mov rbp, [rsp + 24]
    mov rdi, [rsp + 32]
    mov rsi, [rsp + 40]
    mov rdx, [rsp + 48]
    mov rcx, [rsp + 56]
    mov rbx, [rsp + 64]
    lea r10, [rel woody + 0x3648]
    jmp r10
align 8
    woodymsg db '...WOODY...',0x0a,0x0
    end db 0x0

