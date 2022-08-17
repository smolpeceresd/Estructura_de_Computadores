.data
A:.word 5
B:.word 3
C:.word 2
D:.word 2
F:.word 0

.text
begin:

lw s1,A
lw s2,B
lw s3,C
lw s4,D
lw s5,F

add a2,s1,s2
add a3,s3,s4
sub a4,a2,a3
sw a4, 0(s5) 
mv a0,a4

li a7,1
ecall