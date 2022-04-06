.data
.text
.globl	_ZN4Reer15salaireFinalAsmEv

_ZN4Reer15salaireFinalAsmEv:
    pushl   %ebp
    movl    %esp,       %ebp

# DEBUT COMPLETION

    movl    $79520,     %eax                 # SalaireDepart
    movl    $32,        %ecx                 # NBAnneeAvantRetraite
    movl    $100,       %edi

    pushl   %ecx                             # NBAnneeAvantRetraite
    decl    %ecx                             # anneesAvantRetraite - 1

looping:
    pushl   %eax                             # SalaireDepart
    shl     $1,         %eax                 # Deplace un bit a gauche pour eax. Tjrs 1 bit a la fois.
    shl     $1,         %eax                 # Deplace un bit a gauche pour eax. Tjrs 1 bit a la fois.

    jmp     division

division:  
    movl    $0,         %edx                 # precaution
    div     %edi                             # eax = eax / edi = (SalaireDepart / 100)
    movl    %eax,       %esi                 # esi = eax = (SalaireDepart / 100)
    popl    %eax                             # POP (element du haut de la pile ) ==> eax
    addl    %esi,       %eax                 # eax = eax + esi ((SalaireDepart / 100) + (SalaireDepart / 100))

    loop    looping
    popl    %ecx                             # pop ecx
    
    jmp     retour

# FIN COMPLETION
# NE RIEN MODIFIER APRES CETTE LIGNE
retour:
    leave
    ret
