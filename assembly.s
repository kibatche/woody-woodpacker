BITS 64
ALIGN 8
section .text
    global woody
woody:
    sub rsp, 112
    mov [rsp], rbx
    mov [rsp], rcx
    mov [rsp], rdx
    mov [rsp], rsi
    mov [rsp], rdi
    mov [rsp], rbp
    mov [rsp], r8 
    mov [rsp], r9 
    mov [rsp], r10
    mov [rsp], r11
    mov [rsp], r12
    mov [rsp], r13
    mov [rsp], r14
    mov [rsp], r15
    mov rax, 0xa2d;'-\n'
    push rax
    mov rax, 0x2d79646f6f772d2d;'--woody-'
    push rax
    mov rdi, 1
    mov rsi, rsp
    mov rax, 1
    mov rdx, 10
    syscall
    add rsp, 16
    mov r15, [rsp]
    mov r14, [rsp + 8]
    mov r13, [rsp + 16]
    mov r12, [rsp + 24]
    mov r11, [rsp + 32]
    mov r10, [rsp + 40]
    mov r9 , [rsp + 48]
    mov r8 , [rsp + 56]
    mov rbp, [rsp + 64]
    mov rdi, [rsp + 72]
    mov rsi, [rsp + 80]
    mov rdx, [rsp + 88]
    mov rcx, [rsp + 96]
    mov rbx, [rsp + 104]
    lea rdi, [woody]
    jmp rdi


