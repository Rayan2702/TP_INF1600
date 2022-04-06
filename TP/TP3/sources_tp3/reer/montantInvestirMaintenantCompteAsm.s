.data
.text
.globl _ZN6Compte44montantInvestirMaintenantCompteHautRisqueAsmEv

_ZN6Compte44montantInvestirMaintenantCompteHautRisqueAsmEv:
	pushl   %ebp
	movl    %esp,       %ebp

# DEBUT COMPLETION

	movl    8(%ebp),    %ebx
	movl    24(%ebx),   %ecx

	pushl   %ecx
	pushl   %ebx
	
	call _ZN4Reer15salaireFinalAsmEv
	
	popl    %ebx
	popl    %ecx
	
    jmp     looping
	
looping:

	movl    $100,        %edi		# 100/104
	mull    %edi                    # eax = eax * edi
	movl    $104,        %edi		# 100/104
	div     %edi                    # eax = eax / edi
	
	loop    looping
	
	movl    $50000,     %ebx        # ebx = 50000
	subl    %eax,       %ebx        # ebx = ebx - eax
	movl    %ebx,       %eax

    jmp     retour

# FIN COMPLETION
# NE RIEN MODIFIER APRES CETTE LIGNE

retour:
	leave
	ret
