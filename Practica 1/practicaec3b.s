.data 
Dividendo: .word 7
Divisor: .word 3
Cociente:.word 2
Resto: .word 0
.text
begin:
lw s1,Dividendo #guardo el contenido
lw s2,Divisor #guardo el contenido 
lw s3,Cociente #guardo el contenido
la s4,Resto #guardo la direccion de memoria

mul a2,s2,s3
sub a3,s1,a2

sw a3,0(s4) # asigno el valor a 3 a la direccion de memoria del Resto

lw a0,Resto  #asigno a0 al resto para mostrar la variable Resto. -VARIABLE
li a7,1
ecall #muestro el Resto 