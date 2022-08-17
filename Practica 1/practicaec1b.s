.data 

data: .word 5
str: .string "39 \nsteps"

.text
begin:
la a0, str

li a7 4
ecall