.data
.text
.globl	_ZN4Reer29montantAInvestirMaintenantAsmEv

_ZN4Reer29montantAInvestirMaintenantAsmEv:
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
	
	movl    $100,       %edi                
	addl    20(%ebx),   %edi               
	movl    %edi,       %ebx
	movl    $100,       %edi

    jmp     looping

looping:

	movl    $0,         %edx
	mull    %edi                            # eax = eax * edi
	div     %ebx                            # eax = eax / ebx
	
	loop    looping

    jmp     retour

# FIN COMPLETION
# NE RIEN MODIFIER APRES CETTE LIGNE

retour:
	leave
	ret
