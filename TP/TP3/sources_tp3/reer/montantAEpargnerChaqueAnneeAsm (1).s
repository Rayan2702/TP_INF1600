.data
.text
.globl	_ZN4Reer30montantAEpargnerChaqueAnneeAsmEv

_ZN4Reer30montantAEpargnerChaqueAnneeAsmEv:
	pushl   %ebp
	movl    %esp,       %ebp
	
# DEBUT COMPLETION

	movl    8(%ebp),    %ebx       
	movl    24(%ebx),   %ecx  

	pushl   %ecx
	pushl   %ebx

	call _ZN4Reer34montantAmasseFinalAvantRetraiteAsmEv

	popl    %ebx
	popl    %ecx
	
    shl     $1,         %eax       # Deplace un bit a gauche pour eax. Tjrs 1 bit a la fois.
    shl     $1,         %eax       # Deplace un bit a gauche pour eax. Tjrs 1 bit a la fois.
    shl     $1,         %eax       # Deplace un bit a gauche pour eax. Tjrs 1 bit a la fois.
    movl    $0,         %edx
    div     %edi                   # eax = eax / edi

    pushl   %eax 
	pushl   %eax

	movl    %edi,       %eax
	addl    20(%ebx),   %eax
    
    jmp     looping

looping:

	movl    $108,        %ebx       # 108/100 ==> Numerateur
	mull    %ebx                    # eax = eax * ebx
	movl    $100,        %ebx       # 108/100 ==> Denominateur
	movl    $0,          %edx       # edx = 0
	div     %ebx                    # eax = eax / ebx
	
	loop looping

	movl    $0,         %edx
	div     %edi                    # eax = eax / edi
	decl    %eax                    # (-1)
	movl    %eax,       %ebx        

	popl    %eax                    

	movl    $0,         %edx
	div     %ebx                    # eax = eax / ebx 

    jmp     retour

# FIN COMPLETION
# NE RIEN MODIFIER APRES CETTE LIGNE

retour:
	leave
	ret
