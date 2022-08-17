.data
sentence: .string "letras"
        

.text
li a0,4
la t1,sentence	#Print sentence in minus words
la a1,sentence
la a0,sentence
li a7, 4

ecall



lb t2,0(t1)	   #Save the 0 byte in t1 direction in t2 
addi t2,t2,-32  #I deduct 32 from each byte of the word, to  pass it from small letter to big letter
sb t2,0(t1)     #Save in the 1 byte of t1 the value of t2
lb t2,1(t1)	  #Save the 0 byte in t1 direction in t2 
addi t2,t2,-32  #I deduct 32 from each byte of the word, to  pass it from small letter to big letter
sb t2,1(t1)	    #Save in the 1 byte of t1 the value of t2
lb t2,2(t1)		 #Save the 0 byte in t1 direction in t2 
addi t2,t2,-32   #I deduct 32 from each byte of the word, to  pass it from small letter to big letter
sb t2,2(t1)		#Save in the 1 byte of t1 the value of t2
lb t2,3(t1)		
addi t2,t2,-32	
sb t2,3(t1)		
lb t2,4(t1)		
addi t2,t2,-32	
sb t2,4(t1)		
lb t2,5(t1)		
addi t2,t2,-32	
sb t2,5(t1)		
la a1,sentence  #We can't call t1 directly, so I call it throught the variable sentence.
li a7,4
ecall           



	
	




