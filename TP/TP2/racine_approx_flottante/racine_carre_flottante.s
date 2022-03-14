.data
n:
.float 12        # valeur de n
iteration:
.int 10          # nombre d'iterations
x:
.float 12
adr_2:
.float 2

.text
.globl racine_carre_flottante

racine_carre_flottante:

push %ebp               # prologue
mov %esp,%ebp


movl iteration, %ecx
Boucle: 
cmpl $0 , %ecx
je Fin
flds n
flds x
fdivrp
flds x
faddp
flds adr_2
fdivrp
decl %ecx
fstps x
jmp Boucle

Fin:
flds x
call printf

            
pop %ebp    # epilogue
ret