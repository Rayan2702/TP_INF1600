.text
ldi r0, x 
ld r1, (r0)
ldi r0, y
ldi r2, (r0)
ldi r13, 3
ldi r14, 1
ldi r15, 2
ldi r16, 10
ldi r17, 15
ldi r18, 5
ldi r19, 4
loop:
ldi r0, 15
and r3, r1, r14
is_5:
mv r10, r1
boucle1:
sub r10, r10, r18
brlz not5
brnz boucle1
multiple_5:
add r6, r6, r14 
not5:
add r1, r1, r14
sub r5, r2, r1 
brgez is_5 
st (r15), r6
ldi r0, x 
ld r1, (r0)
is_10:
 mv r10, r1 
boucle2:
 sub r10, r10, r16 
 brlz not10 
 brnz boucle2 
 mul10:
 add r7, r7, r14
not10:
 add r1, r1, r14
 sub r5, r2, r1 
 brgez is_10 
 st (r13), r7 
 ldi r0, x 
 ld r1, (r0)
is_15:
 mv r10, r1 
 boucle3:
 sub r10, r10, r17 
 brlz mul15
 brnz boucle3
 mul15:
 add r8, r8, r14
 not15: 
 add r1, r1, r14
 sub r5, r2, r1 
 brgez is_15 
 st (r19), r8
 ldi r0, x 
 ld r1, (r0)
end:
 stop
.data:
x:18
y:21
a:0
b:0
c:0

