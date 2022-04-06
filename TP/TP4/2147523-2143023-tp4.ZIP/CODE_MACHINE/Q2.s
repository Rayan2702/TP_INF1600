 .text
 ldi r0, x
 ld r1, (r0)
 ldi r0, y
 ld r2, (r0)
 ldi r0, 15
 and r3, r1, r0
 ldi r3, 15
 ldi r8, 3
 ldi r9, 7 
 ldi r5, 1
loop:
    is_4:
     and r6, r1, r8
     brnz incrX
     add r7, r7, r5
    is_8:
     and r10, r1, r9
     brnz incrX
     add r11, r11, r5
    is_16:
     and r12, r1, r3 
     brnz incrX
     add r13, r13, r5
    incrX:
     add r1, r1,r5
     sub r12, r2, r1
     brgez is_4
end:
 ldi r0, a
 st (r0), r7
 ldi r0, b
 st (r0), r11
 ldi r0, c
 st (r0), r13
 stop
.data
x: 18
y: 21
a:0 //N multiples de 4
b: 0 // N multiples de 8
c: 0 // N multiples de 16

