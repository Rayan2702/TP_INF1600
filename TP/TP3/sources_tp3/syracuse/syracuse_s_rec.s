.text
.globl syracuse_s_rec
.globl afficher

syracuse_s_rec:
    pushl %ebp
    movl %esp,          %ebp
    pushl %ebx
    movl 12(%esp),      %ebx
    movl 16(%esp),      %ecx


    pushl %ebx
    pushl %ecx
    call afficher
    popl %ecx
    popl %ebx

    cmpl $1,            %ebx
    je fin

    movl %ebx,          %eax
    movl $0,            %edx
    movl $2,            %edi


    div %edi
    cmpl $0,            %edx
    je division


    


    movl %ebx,          %eax
    movl $3,            %edi
    movl $0,            %edx
    mul %edi
    movl %eax,          %ebx
    incl %ebx
    incl %ecx

    jmp fonction


division:
    incl %ecx
    movl %eax,          %ebx
    jmp fonction

fonction:
    pushl %ecx
    pushl %ebx
    call syracuse_s_rec
    popl %ebx
    popl %ecx
    

fin:   
popl %ebx
leave
ret