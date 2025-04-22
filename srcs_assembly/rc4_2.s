BITS 64
section .data
    k db 0x3e, 0xf0, 0x87, 0x16, 0x68, 0x5e, 0x8a, 0x95, 0x0e, 0xc7, 0x7e, 0x18, 0xdb, 0x3e, 0x1b, 0x21, 0xf5, 0xd0, 0x13, 0x8e, 0x26, 0x3f, 0xbc, 0x0f, 0xd0, 0xf4, 0xa1, 0xb4, 0xa5, 0x10, 0x3a, 0x68
    S: times 256 db 0 ; 256
section .text
    global _start
_start:
    xor rcx, rcx
    lea rdi, [S]
    lea rsi, [k]
init_loop_s:
    mov [rdi + rcx], rcx    ; S[rcx] = rcx
    inc rcx
    cmp rcx, 256
    jne init_loop_s
    xor rcx, rcx            ; i = 0
    xor r8, r8              ; j = 0
init_loop_j:
    movzx rax, byte [rdi + rcx]
    add r8, rax     ; j = j + S[i]
    mov r9, rcx
    and r9, 31           ; r9 = i % 32
    movzx rax, byte [rsi + r9]; K[i % 32]
    add r8, rax      ; K[i % 32]
    and r8, 255             ; j %= 256
    xor rax, rax
    movzx r9, byte [rdi + rcx];
    movzx rax, byte [rdi + r8]; see => https://stackoverflow.com/questions/51387571/movzx-missing-32-bit-register-to-64-bit-register
    mov [rdi + rcx], al
    mov [rdi + r8], r9b
    inc rcx
    cmp rcx, 256
    jne init_loop_j
    xor rcx, rcx            ; i = 0
    xor r8, r8              ; j = 0
    xor r9, r9              ; k = 0
    lea rbx, [text]
decipher:
    inc rcx; i = (i + 1);
    and rcx, 255;i = i % 256;
    movzx rax, byte [rdi + rcx];j = (j + S[i]);
    add r8, rax;j = (j + S[i]);
    and r8, 255;j = j % 256;
    xor rax, rax
    movzx r10, byte [rdi + rcx]; unsigned char tmp = S[i];
    movzx rax, byte [rdi + r8];= S[j];
    mov [rdi + rcx], al;S[i] = S[j];
    mov [rdi + r8], r10b; S[j] = tmp;
    xor r10, r10
    xor rax, rax
    movzx rax, byte [rdi + rcx];unsigned char xorkeyint = S[i];
    add r10, rax;unsigned char xorkeyint = S[i];
    movzx rax, byte [rdi + r8];xorkeyint = xorkeyint + S[j];
    add r10, rax;xorkeyint = xorkeyint + S[j];
    and r10, 255;xorkeyint = xorkeyint % 256;
    movzx r11, byte [rdi + r10];xorkeyint = S[xorkeyint];
    xor [rbx + r9], r11b;text[k] = text[k] ^ xorkeyint;
    inc r9
    cmp r9, textend - text
    jne decipher
print:
    lea rsi, [rel text]
    mov rax, 1
    mov rdi, 1
    mov rdx, textend - text
    syscall
    mov rax, 60
    xor rdi, rdi
    syscall

; ─ REGISTRES X86_64 ───────────────────────────────────────────────────────────────────────────────────────────────┐
; Nom | B. | Sous-registres  |                  | Convention d’appel (SysV)                                         |
;─────|────|────────────────────────────────────────────────────────────────────────────────────────────────────────┤
; RAX | 64 | EAX, AX, AH/AL  | valeur de retour | Peut être modifié par la fonction appelée                         |
; RBX | 64 | EBX, BX, BH/BL  |                  | Doit être sauvegardé par la fonction appelée                      |
; RCX | 64 | ECX, RCX, CH/RCX  | 4e arg           | Peut être modifié par la fonction appelée                         |
; RDX | 64 | EDX, DX, DH/DL  | 3e arg           | Peut être modifié par la fonction appelée                         |
; RSI | 64 | ESI, SI, SIL    | 2e arg           | Peut être modifié par la fonction appelée                         |
; RDI | 64 | EDI, DI, DIL    | 1e arg           | Peut être modifié par la fonction appelée                         |
; RBP | 64 | EBP, BP, BPL    | Début stack frame| Faire extrêmement attention à son utilisation et à sa sauvegarde  |
; RSP | 64 | ESP, SP, SPL    | Fin de la pile   | Faire extrêmement attention à son utilisation et à sa sauvegarde  |
; R8  | 64 | R8D, R8W, R8B   | 5e arg           | Peut être modifié par la fonction appelée                         |
; R9  | 64 | R9D, R9W, R9B   | 6e arg           | Peut être modifié par la fonction appelée                         |
; R10 | 64 | R10D, R10W, R10B| temp             | Peut être modifié par la fonction appelée                         |
; R11 | 64 | R11D, R11W, R11B| temp             | Peut être modifié par la fonction appelée                         |
; R12 | 64 | R12D, R12W, R12B| entrypoint (?)   | Doit être sauvegardé par la fonction appelée                      |
; R13 | 64 | R13D, R13W, R13B|                  | Doit être sauvegardé par la fonction appelée                      |
; R14 | 64 | R14D, R14W, R14B|                  | Doit être sauvegardé par la fonction appelée                      |
; R15 | 64 | R15D, R15W, R15B|                  | Doit être sauvegardé par la fonction appelée                      |
;───────────────────────────────────────────────────────────────────────────────────────────────────────────────────┘

;── Syscalls Linux ──┬─────────────┬────────┬────────────┬───────────────┬──────────────┬──────────────┬──────────┐
; NR │ Syscall Name  │ rax (ID)    │ rdi    │ rsi        │ rdx           │ r10          │ r8           │ r9       │
;────┼───────────────┼─────────────┼────────┼────────────┼───────────────┼──────────────┼──────────────┼──────────┤
;  0 │ read          │ 0x00        │ fd     │ *buf       │ count         │ -            │ -            │ -        │
;  1 │ write         │ 0x01        │ fd     │ *buf       │ count         │ -            │ -            │ -        │
;  2 │ open          │ 0x02        │ *path  │ flags      │ mode          │ -            │ -            │ -        │
;  3 │ RCXose         │ 0x03        │ fd     │ -          │ -             │ -            │ -            │ -        │
;  4 │ stat          │ 0x04        │ *path  │ *statbuf   │ -             │ -            │ -            │ -        │
;  5 │ fstat         │ 0x05        │ fd     │ *statbuf   │ -             │ -            │ -            │ -        │
;  6 │ lstat         │ 0x06        │ *path  │ *statbuf   │ -             │ -            │ -            │ -        │
;  7 │ poll          │ 0x07        │ *ufds  │ nfds       │ timeout       │ -            │ -            │ -        │
;  8 │ lseek         │ 0x08        │ fd     │ offset     │ whence        │ -            │ -            │ -        │
;  9 │ mmap          │ 0x09        │ ?      │ ?          │ ?             │ ?            │ ?            │ ?        │
; 10 │ mprotect      │ 0x0a        │ addr   │ len        │ prot          │ -            │ -            │ -        │
; 11 │ munmap        │ 0x0b        │ addr   │ len        │ -             │ -            │ -            │ -        │
; 12 │ brk           │ 0x0c        │ brk    │ -          │ -             │ -            │ -            │ -        │
; 13 │ rt_sigaction  │ 0x0d        │ sig    │ *act       │ *oldact       │ sigsetsize   │ -            │ -        │
; 14 │ rt_sigprocmask│ 0x0e        │ how    │ *set       │ *oldset       │ sigsetsize   │ -            │ -        │
; 15 │ rt_sigreturn  │ 0x0f        │ ?      │ ?          │ ?             │ ?            │ ?            │ ?        │
; 16 │ ioctl         │ 0x10        │ fd     │ cmd        │ arg           │ -            │ -            │ -        │
; 17 │ pread64       │ 0x11        │ fd     │ *buf       │ count         │ pos          │ -            │ -        │
; 18 │ pwrite64      │ 0x12        │ fd     │ *buf       │ count         │ pos          │ -            │ -        │
; 19 │ readv         │ 0x13        │ fd     │ *vec       │ vlen          │ -            │ -            │ -        │
; 20 │ writev        │ 0x14        │ fd     │ *vec       │ vlen          │ -            │ -            │ -        │
; 21 │ access        │ 0x15        │ *path  │ mode       │ -             │ -            │ -            │ -        │
; 22 │ pipe          │ 0x16        │ *fds   │ -          │ -             │ -            │ -            │ -        │
; 23 │ select        │ 0x17        │ n      │ *in        │ *out          │ *exc         │ *tv          │ -        │
; 24 │ sched_yield   │ 0x18        │ -      │ -          │ -             │ -            │ -            │ -        │
; 25 │ mremap        │ 0x19        │ addr   │ old_len    │ new_len       │ flags        │ new_addr     │ -        │
; 26 │ msync         │ 0x1a        │ start  │ len        │ flags         │ -            │ -            │ -        │
; 27 │ mincore       │ 0x1b        │ start  │ len        │ *vec          │ -            │ -            │ -        │
; 28 │ madvise       │ 0x1c        │ start  │ len        │ behavior      │ -            │ -            │ -        │
; 29 │ shmget        │ 0x1d        │ key    │ size       │ flag          │ -            │ -            │ -        │
; 30 │ shmat         │ 0x1e        │ shmid  │ *shmaddr   │ shmflg        │ -            │ -            │ -        │
; 31 │ shmctl        │ 0x1f        │ shmid  │ cmd        │ *buf          │ -            │ -            │ -        │
; 32 │ dup           │ 0x20        │ oldfd  │ -          │ -             │ -            │ -            │ -        │
; 33 │ dup2          │ 0x21        │ oldfd  │ newfd      │ -             │ -            │ -            │ -        │
; 34 │ pause         │ 0x22        │ -      │ -          │ -             │ -            │ -            │ -        │
; 35 │ nanosleep     │ 0x23        │ *rqtp  │ *rmtp      │ -             │ -            │ -            │ -        │
; 36 │ getitimer     │ 0x24        │ which  │ *value     │ -             │ -            │ -            │ -        │
; 37 │ alarm         │ 0x25        │ seconds│ -          │ -             │ -            │ -            │ -        │
; 38 │ setitimer     │ 0x26        │ which  │ *value     │ *ovalue       │ -            │ -            │ -        │
; 39 │ getpid        │ 0x27        │ -      │ -          │ -             │ -            │ -            │ -        │
; 40 │ sendfile      │ 0x28        │ out_fd │ in_fd      │ *offset       │ count        │ -            │ -        │
; 41 │ socket        │ 0x29        │ domain │ type       │ protocol      │ -            │ -            │ -        │
; 42 │ connect       │ 0x2a        │ sockfd │ *addr      │ addrlen       │ -            │ -            │ -        │
; 43 │ accept        │ 0x2b        │ sockfd │ *addr      │ *addrlen      │ -            │ -            │ -        │
; 44 │ sendto        │ 0x2c        │ sockfd │ *buf       │ len           │ flags        │ *dest_addr   │ addrlen  │
; 45 │ recvfrom      │ 0x2d        │ sockfd │ *buf       │ len           │ flags        │ *src_addr    │ *addrlen │
; 59 │ execve        │ 0x3b        │ *file  │ *argv      │ *envp         │ -            │ -            │ -        │
; 60 │ exit          │ 0x3c        │ status │ -          │ -             │ -            │ -            │ -        │
;────┴───────────────┴─────────────┴────────┴────────────┴───────────────┴──────────────┴──────────────┴──────────┘
