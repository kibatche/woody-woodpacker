BITS 64
section .rodata
    woody db "--woody--"
section .text
    global _start
_start:
    mov rax, 1
    mov rdi, 1
    mov rsi, woody
    mov rdx, 9
    syscall
    xor rax, rax
    mov rax, 0x401050
    jmp rax
