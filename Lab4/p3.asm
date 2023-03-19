.data
  sir: .asciiz "pushi are lungimea 21"
.text

main:
	la a0, sir	# pune valoare parametru in $a0
	jal ra, length				# apel procedura

	li a0, 1			
	addi a1, a5, 0
	ecall				


	li a0, 17				# apel serviciu sistem de operare
	li a1, 0
	ecall					# pentru terminare program


length:
        addi sp, sp, -32
        sw ra, 28(sp)
        sw s0, 24(sp)
        addi s0, sp, 32
        sw a0, -20(s0)
        lw a5, -20(s0)
        lbu a5, 0(a5)
        beq     a5, zero, .return_zero
        lw      a5, -20(s0)
        addi    a5,a5,1
        mv      a0,a5
        call    length
        mv      a5,a0
        addi    a5,a5,1
        j       .return_si_atat
.return_zero:
        li      a5,0
.return_si_atat:
        mv      a0,a5
        lw      ra,28(sp)
        lw      s0,24(sp)
        addi    sp,sp,32
        jr      ra