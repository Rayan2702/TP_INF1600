.data
string1:
.ascii "This is an example of a test for your function"
length:
.int 49
string2:
.ascii "test"

.text
.globl scan

scan : 
push    %ebp
mov     %esp,        %ebp
push    %ebx
                 
movl    $string1,    %edi                 
movl    $string2,    %esi                     
mov     length,      %ecx 
cld                                      # esi and edi increments by 1 

lodsl                                    # Moves the value in esi [String2] IN al, ax, eax 
repne   scasb                            # repeat the loop ==> (compare the value in edi[String1] with 
jne     out                              # al, ax and eax) until it's not equal
                                         # BASICALLY comparing the 2 strings until it's not equal
mov     length,      %eax                # eax = 49 
subl    %ecx,        %eax                # eax = eax - ecx[which increments]
sub     $1,          %eax                # eax = eax -1

movl    $1,          %edx                # edx = 1
mul     %edx                             # eax = eax * edx
add     $1,          %eax                # eax = eax + 1

leave
ret


out:
mov     $0,          %eax


pop     %ebx
pop     %ebp 
ret
