section .data:
    k db 0x8c, 0x26, 0xf3, 0x43, 0x9d, 0x5c, 0xd6, 0x3b, 0x22, 0x29, 0xa9, 0xc8, 0x6e, 0x06, 0xfa, 0xbe, 0x28, 0xb2, 0x9d, 0x3a, 0xe6, 0xd1, 0xbc, 0x4b, 0x9c, 0xec, 0x45, 0x7d, 0xb4, 0x91, 0x9d, 0x27
    text db 'this is a secret'
    textend db 0x0
    S: resb 0x100; 256
section .text:
    global rc4
rc4:
    xor CX, CX
init_loop_s:
    mov byte [S + CX], CL; S[CX] = 8 bits du registre (r)CX
    inc CX
    jno init_loop_s
    xor CL, CL;i = 0
    xor R8W, R8W;j = 0
init_loop_j:
    add R8W, byte [S + CL]; r8w = r8w + S[CL]
    mov R9B, CL; R9B = CL (8 derniers bits de chaque)
    and R9B, 31; R9B = i % 32
    add R8W, byte [k + R9B]; R8W = k[R9B]
    and R8W, 255; j % 256
    mov R9B, byte [S + CL]
    mov byte [S + CL], byte [S + r8b]
    mov byte [S + R8W], R9B
    inc CL
    jno init_loop_j; jump if no overflow, ça sauve ptet une ligne de code
    xor CX, CX;i = 0
    xor R8W, R8W;j = 0
    xor R9, R9;k = 0
cipher:
    inc CX; CX++
    and CX, 255; CX % 256
    add R8W, byte [S + CL]; R8W = r8b + S[CL]
    and R8W, 255; R8W % 256
    mov R10B, byte [S + CL]; R10B = S[CL]
    mov byte [S + CL], byte [S + r8b]; S[CL] = S [r8b]
    mov byte [S + r8b], R10B; S[r8b] = tmp (R10B)
    xor R10W, R10W; on remet à 0 car apriori les petits registre ne remettent pas à 0.
    add R10W, byte [S + CL] ; R10W = R10W + S[CL]
    add R10W, byte [S + r8b]; R10W = R10W + S[R8W]
    and R10W, 255; R10W = R10W % 256
    mov R11B, byte [S + R10W]; R11B = S[(S[cl] + S[r8b]) % 256]
    xor [text + R9], R11B; text[R9] ^= R11B
    inc R9; R9++
    cmp R9, textend - text; len de text, via un calcul d'adresse (sauve une ligne)
    jne cipher; R9 < len(text) ? jmp : continue

; ─ REGISTRES X86_64 ───────────────────────────────────────────────────────────────────────────────────────────────┐
; Nom | B. | Sous-registres  |                  | Convention d’appel (SysV)                                         |
;─────|────|────────────────────────────────────────────────────────────────────────────────────────────────────────┤
; RAX | 64 | EAX, AX, AH/AL  | valeur de retour | Peut être modifié par la fonction appelée                         |
; RBX | 64 | EBX, BX, BH/BL  |                  | Doit être sauvegardé par la fonction appelée                      |
; RCX | 64 | ECX, CX, CH/CL  | 4e arg           | Peut être modifié par la fonction appelée                         |
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
;  3 │ CLose         │ 0x03        │ fd     │ -          │ -             │ -            │ -            │ -        │
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