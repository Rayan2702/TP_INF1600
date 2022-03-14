.data
n: .int 15
xn: .int 15
iteration: .int 10


.text
.globl racine_carree_entiere

racine_carree_entiere:

push %ebp
mov %esp,%ebp
push %ebx

movl  xn,%eax        
movl  iteration, %ecx

Boucle:
cmpl $0 , %ecx
je Fin
movl $0, %edx
movl %eax, %ebx
movl n,%eax
div %ebx
add %ebx, %eax
shr $1, %eax
sub $1, %eax
decl %ecx
jmp Boucle

Fin:
pushl %eax


addl $4, %esp

pop %ebx
pop %ebp
ret