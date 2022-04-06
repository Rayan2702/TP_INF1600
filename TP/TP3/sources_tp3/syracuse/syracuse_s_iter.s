.text
.globl syracuse_s_iter
.globl afficher

syracuse_s_iter:
pushl   %ebp
movl    %esp,               %ebp
pushl   %ebx
# DEBUT COMPLETION
movl    12(%esp),           %eax
movl    $0,                 %ecx

boucle:
cmpl    $1,                 %eax
je affichage
pushl   %eax
pushl   %ecx
call afficher
popl %ecx
popl %eax
push    %eax
mov     $0,                 %edx 
mov     $2,                 %ebx 
div     %ebx
cmpl    $0,                 %edx
je division
popl    %eax
movl    $3,                 %ebx
movl    $0,                 %edx
mul     %ebx
addl    $1,                 %eax
incl    %ecx    
jmp boucle
division:
incl    %ecx
jmp boucle

affichage:
pushl   %eax
pushl   %ecx
call afficher
popl    %ecx
popl %eax
# FIN COMPLETION
# NE RIEN MODIFIER APRES CETTE LIGNE
fin:   
popl %ebx
leave
ret
