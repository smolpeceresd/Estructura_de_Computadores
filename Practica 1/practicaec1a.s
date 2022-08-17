.data 
data: .word 5
str:  .string "this is an example"

.text
begin:
la a0,str

li a7 4
ecall