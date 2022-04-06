.text
.globl quicksort_s
swaprefs:
    pop     %eax                
    decl    %eax                

    push    %eax                
    push    %esi                
    push    %ebx                
    call    swapRefs
    popl    %ebx
    popl    %esi
    popl    %eax
    jmp quicksort

quicksort_s:
    pushl   %ebp
    movl    %esp,                   %ebp
    pushl   %ebx
    movl    12(%esp),               %ebx     
    movl    16(%esp),               %esi     
    movl    20(%esp),               %edi    
    pushl    %edi                 
    pushl    %esi                 
    pushl    %edi  
    pushl    %esi               
    addl     $2,                     %esi     
    cmpl     %edi,                   %esi
    popl     %esi
    ja      retour
    pushl    %edi                 
    pushl    %esi                 
    pushl    %ebx                 
    call    medianOfThree
    popl     %ebx
    popl     %esi
    popl     %edi
rightmoins1:
    decl    %edi                                       
boucle_incrementation:
    pushl    %eax
    movl    $4,                     %eax
    mull    %esi
    addl    %eax,                   %ebx     
    movl    %eax,                   %ecx     
    popl     %eax
boucle1:
    incl    %esi               
    addl    $4,                     %ebx
    addl    $4,                     %ecx
    cmpl    (%ebx),                   %eax
    ja      boucle1
    subl    %ecx,                   %ebx    
    pushl    %eax
    movl    $4,                     %eax
    mull    %edi
    addl    %eax,                   %ebx    
    movl    %eax,                   %ecx    
    pop     %eax
boucle2:
    decl    %edi                
    subl    $4,                     %ebx
    subl    $4,                     %ecx
    cmpl    %eax,                   (%ebx)
    ja      boucle2
    subl    %ecx,                   %ebx   
    cmp     %esi,                   %edi
    jb     swaprefs
    push    %eax
    push    %edi
    push    %esi
    push    %ebx
    call    swapRefs           
    addl    $12,                    %esp
    pop     %eax
    jmp     boucle_incrementation
quicksort:
    pop     %eax                
    subl    $1,                     %esi    
    pushl    %esi                
    pushl    %eax                
    pushl    %ebx                
    call    quicksort_s
    popl    %ebx
    popl    %eax
    popl    %esi 
    popl     %eax                
    addl     $2,                     %esi    
    pushl    %eax                
    pushl    %esi                
    pushl    %ebx                
    call    quicksort_s
    popl    %ebx
    popl    %esi
    popl    %eax
retour:   
    leave
    ret