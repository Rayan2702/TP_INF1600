.data
string1:
.ascii "testor"
length1:
.int 6
string2:
.ascii "testor"
length2:
.int 6

.text                                   # 255 -> string1 < string2
.globl comparaison                      # 0 -> sring1 == string2
                                        # 1 -> string1 > stirng2
comparaison :   
  
    movl    $string1,      %edi         # Here the two strings HAS to be defined as edi and esi so I can use the     
    movl    $string2,      %esi         # function 'cmpsb' later on  
    movl    length1,       %ebx         
    movl    length2,       %ecx
                                        
lecture: 
    cmpsb                                # compares the stocked value at esi with the one in edi (first letter)
    je      SAME_letter                  # the two strings are equal
    ja      string2_BIGGEST              # esi > edx : string2 is the bigger one 
    jb      string2_SMALLEST             # esi < edi : string2 is the smaller one 

SAME_letter:
    cld                                  # Incrementation of esi and edi
    decl    %ebx
    decl    %ecx

    movl    %ebx,   %eax
    addl    %ecx,   %eax
    cmp     $0,     %eax                 # if both string add together gives 0, they are the same
    jz      string_EQUAL

    cmp     $0,     %ebx
    jz      string2_BIGGEST              # ebx < ecx

    cmp     $0,     %ecx                 # ecx > ebx
    jz      string2_SMALLEST

    jmp     lecture

string2_BIGGEST:   
    call    printf                       # From here, the statement of the problem which has been
    mov     $255,          %eax          # mentionned above is recreated
    ret

string2_SMALLEST:                        
    call    printf                       
    mov     $1,            %eax
    ret

string_EQUAL:
    call    printf
    mov     $0,            %eax
    ret

leave
ret

    


