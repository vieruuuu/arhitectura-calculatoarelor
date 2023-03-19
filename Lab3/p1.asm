
# program care calculeaza numarul de biti de 1 dintr-un cuvant

# pseudocod

# a0 = 0x0C 		// valoarea pentru care se face calculul 
# t0 = 32;			// numar de daplasri pentru t1
# t1 = 0x00000001;  // masca - valoare initiala
# v0 = 0;           // rezultatul calculului
# do {
#    if (t1 & a0) {	// si logic pe biti
#        v0++;
#    }
#    t0--;
#    t1 <<= 1;
# } while (t0);

.data
	value: .word 0x80000008 # pentru aceasta valoare, rezultatul trebuie sa fie 2

.text

j main

count_ones:
	addi t0, zero, 32
	addi t1, zero, 1
	add t3, a0, zero
	add a0, zero, zero
	
repeat:	
	and t2, t3, t1
	beq t2, zero, bit_is_zero

	addi a0, a0, 1
bit_is_zero:
	slli t1, t1, 1
	addi t0, t0, -1
	bne t0, zero, repeat
	
	jalr zero ra 0

main:
	lui t0, 0x10000
	lw a0, 0(t0)
	
	jal ra, count_ones
	