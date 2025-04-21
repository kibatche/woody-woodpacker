BITS 64
ALIGN 8
section .text
    global woody
woody:
    sub rsp, 88
    mov [rsp], rbx
    mov [rsp], rcx
    mov [rsp], rdx
    mov [rsp], rsi
    mov [rsp], rdi
    mov [rsp], rbp
    mov [rsp], r8
    mov [rsp], r9
    mov [rsp], r13
    mov [rsp], r14
    mov [rsp], r15
    mov rdi, 1
    lea rsi, [rel woodymsg]
    mov rax, 1
    mov rdx, end - woodymsg
    syscall
    xor rcx, rcx
    lea rdi, [rel S]
    lea rsi, [rel k]
init_loop_s:
    mov byte [rdi + rcx], cl
    inc rcx
    cmp rcx, 256
    jne init_loop_s
    xor rcx, rcx
    xor r8, r8
init_loop_j:
    movzx rax, byte [rdi + rcx]
    add r8, rax
    mov r9, rcx
    and r9, 31
    movzx rax, byte [rsi + r9]
    add r8, rax
    and r8, 255
    xor rax, rax
    movzx r9, byte [rdi + rcx]
    movzx rax, byte [rdi + r8]
    mov byte [rdi + rcx], al
    mov byte [rdi + r8], r9b
    inc rcx
    cmp rcx, 256
    jne init_loop_j
    xor rcx, rcx
    xor r8, r8
    xor r9, r9
    lea rbx, [rel woody %c 0x%lx]
decipher:
    inc rcx
    and rcx, 255
    movzx rax, byte [rdi + rcx]
    add r8, rax
    and r8, 255
    xor rax, rax
    movzx r10, byte [rdi + rcx]
    movzx rax, byte [rdi + r8]
    mov byte [rdi + rcx], al
    mov byte [rdi + r8], r10b
    xor r10, r10
    xor rax, rax
    movzx rax, byte [rdi + rcx]
    add r10, rax
    movzx rax, byte [rdi + r8]
    add r10, rax
    and r10, 255
    movzx r11, byte [rdi + r10]
    xor [rbx + r9], r11b
    inc r9
    cmp r9, 0x%lx
    jne decipher
    mov r15, [rsp + 0]
    mov r14, [rsp + 8]
    mov r13, [rsp + 16]
    mov r9 , [rsp + 24]
    mov r8 , [rsp + 32]
    mov rbp, [rsp + 40]
    mov rdi, [rsp + 48]
    mov rsi, [rsp + 56]
    mov rdx, [rsp + 64]
    mov rcx, [rsp + 72]
    mov rbx, [rsp + 80]
    lea r10, [rel woody %c 0x%lx]
    jmp r10
align 8
    woodymsg db '....WOODY....',0x0a,0x0
    end db 0x0
    k db 0x%x, 0x%x, 0x%x, 0x%x, 0x%x, 0x%x, 0x%x, 0x%x, 0x%x, 0x%x, 0x%x, 0x%x, 0x%x, 0x%x, 0x%x, 0x%x, 0x%x, 0x%x, 0x%x, 0x%x, 0x%x, 0x%x, 0x%x, 0x%x, 0x%x, 0x%x, 0x%x, 0x%x, 0x%x, 0x%x, 0x%x, 0x%x
    S: times 256 db 0


