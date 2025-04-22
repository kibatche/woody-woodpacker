BITS 64
ALIGN 8
section .text
    global woody
woody:
    push rbx  
    push rcx  
    push rdx  
    push rsi  
    push rdi  
    push rbp  
    push r8  
    push r9   
    push r13  
    push r14  
    push r15  
    mov rdi, 1;syscall 1 (write)
    lea rsi, [rel woodymsg]; load effective address, permet de load l'adresse du tableau de bytes woodymsg directement dans rsi (check syscall)
    mov rax, 1; fd 1
    mov rdx, end - woodymsg;taille
    syscall
    pop r15
    pop r14
    pop r13
    pop r9
    pop r8
    pop rbp
    pop rdi
    pop rsi
    pop rdx
    pop rcx
    pop rbx
    lea r10, [rel woody + 0x3648]
    jmp r10
align 8
    woodymsg db '...WOODY...',0x0a,0x0
    end db 0x0

