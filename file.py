def generate_asm():
    # Liste des registres à sauvegarder
    registers = [
        'rbx', 'rcx', 'rdx', 'rsi', 'rdi', 'rbp', 'r8', 'r9', 'r10', 'r11', 'r13', 'r14', 'r15'
    ]
    
    # Initialisation du code assembleur
    asm_code = []
    
    # Sauvegarder les registres sur la pile (en utilisant `mov [rsp], registre`)
    for reg in registers:
        asm_code.append(f"mov [rsp], {reg}  ; Sauvegarde {reg} dans [rsp]")
        asm_code.append("sub rsp, 8  ; Décrementer rsp pour le prochain registre")
    
    # Restaurer les registres depuis la pile (en utilisant `mov registre, [rsp + x]`)
    offset = 0
    for reg in registers:
        asm_code.append(f"mov {reg}, [rsp + {offset}]  ; Restaurer {reg} depuis la pile")
        offset += 8  # Chaque registre est de 8 octets (sur x86_64)
    
    # Générer le code assembleur sous forme de chaîne
    return "\n".join(asm_code)


# Sauvegarder le code dans un fichier .asm
with open('save_restore.asm', 'w') as file:
    file.write(generate_asm())

print("Le code assembleur a été généré dans 'save_restore.asm'.")
