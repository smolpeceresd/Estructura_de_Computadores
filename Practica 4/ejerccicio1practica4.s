.data

length: .word 7

space: .word 32

list: .word 7
	  .word 5
      .word -4
      .word 100
      .word -250
      .word 73
      .word -50

.text
lw a0, length #Cargamos el valor de la longitud
la a1, list   #Cargamos en a0 la primera posición del array
li, t1, 0     #contador

begin:

beq t1, a0, end #Se compara si el valor del contador es igual a la longitud. SI es igual, saltamos a end
#jal ra, print Saltamos a print para imprimir el entero y el espacio
#-----------------------------------------------------------
print:
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
addi t1, t1, 1 #Aumentamos el contador
j begin        #Volvemos a label

end:
nop
