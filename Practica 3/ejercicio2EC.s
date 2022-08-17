.data
value: .word 8
sentence: .string " \nHello wordl \n"
Salto: .word 12

.text
#begin:
jal print_value
jal print_sentence
jal print_jump
j end

#-------------------------------------------------------------------------------
print_value: # a2 (in): Value
			 # a1 (out): Value to print
			 # Function: This procedure receives one interger value and print it
begin_print:
#---------------
#save context
addi sp,sp,-8
sw a2,4(sp)
sw a1,0(sp)
#---------------
lw a0,value
li a7,1
ecall			#Print the word value
end_print:
#restore context
lw a1,0(sp)
lw s2,4(sp)
addi sp,sp,8
#----------------
jalr zero,ra,0
#--------------------------------------------------------------------------------
#----------------------------------------------------------------------------
print_sentence: # a2 (in): Sentence
			 	# a1 (out): Sentence to print
			 	# Function: This procedure receives one sentence and print it
begin_print_sentence:
#--------------------
#save context
addi sp,sp,-8
sw a2,4(sp)
sw a1,0(sp)
#--------------------
la a0,sentence
li a7,4
ecall            #Print string sentence
end_print_sentence:
#restore context
lw a1,0(sp)
lw s2,4(sp)
addi sp,sp,8
#--------------------
jalr zero,ra,0
#--------------------
#-------------------------------------------------------
print_jump: 
		    # a1 (out): Value to print
			# Function: This procedure print a jump line
begin_print_jump:
#---------------
#save context
addi sp,sp,-4
sw a1,0(sp)
#---------------
lw a0,Salto
li a7,1
ecall				#Print a jump line
end_print_jump:
#restore context
lw a1,0(sp)
addi sp,sp,4
#---------------
jalr zero,ra,0
#--------------------------------------------------------

end:
nop