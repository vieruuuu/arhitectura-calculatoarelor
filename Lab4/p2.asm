.data
  sir: .asciiz "ana are mere"
.text

main:
	la a0, sir	# pune valoare parametru in $a0
	jal ra, reverse				# apel procedura

	li a0, 17				# apel serviciu sistem de operare
	li a1, 0
	ecall					# pentru terminare program

reverse:
        addi    sp,sp,-32
        sw      ra,28(sp)
        sw      s0,24(sp)
        addi    s0,sp,32
        sw      a0,-20(s0)
        lw      a5,-20(s0)
        lbu     a5,0(a5)
        beq     a5,zero,.L3


        lw      a5,-20(s0)
        addi    a5,a5,1
        mv      a0,a5
        jal    reverse

        li a0, 11
        lw      a5,-20(s0)
        lbu     a5,0(a5)
        addi a1, a5, 0
        ecall
.L3:
        nop
        lw      ra,28(sp)
        lw      s0,24(sp)
        addi    sp,sp,32
        jr      ra