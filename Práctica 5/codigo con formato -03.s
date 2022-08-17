.data
arg: .word 7

.text
#llamamos al procedimiento
lw a0,arg
jal ra,fact

# print resultado
li a7,1
ecall

end:
li a7,10
ecall
fact:
      blez    a0, .LBB0_4
        mv      a1, a0
        addi    a0, zero, 1
        addi    a2, zero, 1
        beq     a1, a2, .LBB0_3
.LBB0_2:                                # =>This Inner Loop Header: Depth=1
        addi    a2, a2, 1
        mul     a0, a0, a2
        bne     a1, a2, .LBB0_2
.LBB0_3:
        ret
.LBB0_4:
        addi    a0, zero, 1
        ret