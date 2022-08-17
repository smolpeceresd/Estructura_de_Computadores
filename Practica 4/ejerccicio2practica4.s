.data
length: .word 7
space: .word 32
list: .word -250
      .word 7
		.word -50
			.word -4
			.word 5
	    .word 100
	    .word 73     
.text
lw a0, length #Cargamos el valor de la longitud
li, t3, 0     #contador
li, t4,0      #contador
li, t5,0      #contador
begin_ordenar:
li t5,0
#----------------
#save context
addi sp, sp -4 
sw ra, 0(sp)
#----------------
la a1, list 
begin:
lw t1,0(a1)     
lw t2,4(a1)
blt t1,t2,menor
sw t1,4(a1)     
sw t2,0(a1)
addi t5,t5,1
menor:
addi a1,a1,4
addi t3,t3,1
beq t3,a0,rst
j begin
rst:
li t3,0
bne t5,zero,begin_ordenar
imp:
#----------------
#restore context
lw ra, 0(sp)
addi sp, sp 4
#----------------
end_ordenar:
la a1,list
print:
beq t4,a0,end
begin_print:
#----------------
#save context
addi sp, sp -12
sw ra, 8(sp)
sw a0, 4(sp)
sw a1, 0(sp)
#----------------
lw a0, 0(a1)   #Imprimir entero
li a7, 1
ecall
lw a0, space   #Imprimir espacio
li a7, 11
ecall
#----------------
#restore context
lw a1, 0(sp)
lw a0, 4(sp)
lw ra, 8(sp)
addi sp, sp 12
#----------------
end_print:
addi a1, a1, 4 #Nos desplazamos a la siguiente posición del array
addi t4, t4, 1 #Aumentamos el contador
j print
end:
nop

