.data 
Dividendo: .word 7
Divisor: .word 3
Resto: .word 0
.text
begin:
lw s1,Dividendo #guardo el contenido
lw s2,Divisor #guardo el contenido 
la s3,Resto #guardo la direccion de memoria

rem a3,s1,s2 # hago la division

mv a0,a3  #le genero una copia

sw a3,0(s3) # asigno el valor a 3 a la direccion de memoria del Resto

lw a0,Resto  #asigno a0 al resto para mostrar la variable Resto. -VARIABLE

ecall #muestro el Resto