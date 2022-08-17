.data
year: .word 2020
no: .string "is not a leap year."
yes: .string "is a leap year."

.text
begin:
lw a1,year
li t3,100
li t4,4
li t5,400
jal lape
j end

#------------------------------------------------------------------------
lape: # a1 (in): Year
	  # a0 (out): Signal that says if the year it is lape
	  # Function: This procedure says if a year is lape
begin_lape:
#-------------
#save context
addi sp,sp,-12
sw t6,8(sp)
sw s2,4(sp)
sw a1,0(sp)
#-------------
rem t6,a1,t3      #Calculate the rest of year/100
beq t6,zero,isnt  #If t6=0 go to isnt
rem t6,a1,t4	  #Calculate the rest of year/4
beq t6,zero,is    #If t6=0 go to is

isnt:
rem t6,a1,t5      #Calculate the rest of year/400
beq t6,zero,is    #If t6=0 go to is
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
ecall	  #a0=0
#-------------
end_lape:
#restore context
lw a1,0(sp)
lw s2,4(sp)
lw t6,8(sp)
addi sp,sp,12
#------------
jalr zero,ra,0
#-------------

end:
nop