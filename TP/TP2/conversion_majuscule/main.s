.data
string1:
.asciz "This is a TEST, of the conversion program!\n"
length:
.int 43 

.text
.globl main


main : 
    push    %ebp
    mov     %esp,   %ebp
    push    %ebx

    movl    $string1,       %esi             # esi is mostly for strings. That also applies to edi. 
    movl    length,         %ecx             # ecx = 43

Lecture:
    cmpb    $'a',         (%esi)             # comparing each character of the $string with a (ASCII) ... A to Z
    jb      Next_Character                   # intruction
 
    cmpb    $'z',         (%esi)             # comparing each character of the $string with z (ASCII)
    ja      Next_Character                   # intruction
 
    subl    $32,          (%esi)             # 'substracting' each letter of the string by 32. 
                                             # there's a difference of 32 between the uppercase letter 
                                             # and the lowercase letter of the ASCII table 

Next_Character:
    incl    %esi                             # go to the next letter of of the string
    decl    %ecx                             # declining the length of the string by one
     
    cmp     $0,             %ecx             # comparing the length to 0 
    je      End                              # if it's equal to zero got to End
    jmp     Lecture                          # else go to Lecture 


End:
    movl    length,         %ecx            
    subl    %ecx,           %esi            # imagine that there's a block on each letter ... so THE STRING - 43
    push    %esi                            # well ... push
    call    printf                          # print function
    addl    $4,             %esp            # 'next boxe' in the pile

    pop     %ebx
    pop     %ebp
    ret
    
    
                            
    



