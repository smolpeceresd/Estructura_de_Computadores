.data
sentence: .string "hola mundo."
jump: .word 10
point: .word 46   
space: .word 32      

.text
la t1,sentence     #load the adresses of memory values
lb t2,point
lb t3,space
li a7,4		   #print original sentence
la a0,sentence
ecall
start:
lb t4,0(t1)			#Load the 0 byte of t1 in t4
beq t4,t2,end 		#if t4=t2 go to end
beq t4,t3,counter   #if t4=t3 go to counter
addi t4,t4,-32		#t4=t4-32 to pass each letter from small letter to big letter
sb t4,0(t1)         #storage t4 in byte 0 of t1

counter:            
addi t1,t1,1		#t1=t1+1, to pass throught the sentence
j start             #go to start

end:
la a0,sentence		#print new sentence
ecall

          



	
	




