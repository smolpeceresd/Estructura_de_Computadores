.data
year: .word 2020
no: .string "is not a leap year."
yes: .string "is a leap year."

.text
lw t0,year
la t1,no
la t2,yes
li t3,100
li t4,4
li t5,400
rem t6,t0,t3      #Calculate the rest of year/100
beq t6,zero,isnt  #if t6=zero go to isnt
rem t6,t0,t4	  #Calculate the rest of year/4
beq t6,zero,is    #if t6=zero go to is

isnt:
rem t6,t0,t5      #Calculate the rest of year/400
beq t6,zero,is	  #if t6=zero go to is
lw a0,year
li a7,1         
ecall             #print year
la a0,no
li a7,4
ecall	  		  #print string no
j end

is:
lw a0,year
li a7,1
ecall             #print year
la a0,yes
li a7,4         #print string yes
ecall

end:
nop
