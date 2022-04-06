.text
ldi r1, 24
ldi r2, 12
ldi r4, 8
preliminaire:
sub r3, r1, r2
brz end 
brlz sous 
sub r1, r1, r2
br preliminaire
sous:
sub r2, r2, r1
br preliminaire 
end:
st (r4), r1
stop
.data

