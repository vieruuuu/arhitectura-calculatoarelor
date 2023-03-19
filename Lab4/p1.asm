.data

.text

main:
	
	li a0, 123	# pune valoare parametru in $a0
	jal ra, afis				# apel procedura

	li a0, 17				# apel serviciu sistem de operare
	li a1, 1
	ecall					# pentru terminare program

afis:
	addi sp, sp, -12		# alocare spatiu pe stiva pentru salvare valori registre folosite de procedura		
	sw ra, 0(sp)			# salvare valoare registru pe stiva
	sw s0, 4(sp)			# salvare valoare registru pe stiva
	sw s1, 8(sp)			# salvare valoare registru pe stiva
	
	slti t0, a0, 10
	bne t0, zero, print_char
	
	addi t0, zero, 10

	div s1, a0, t0
	rem s0, a0, t0
	
	add a0, s1, zero
	jal afis
	
	add a0, s0, zero
	
print_char:

	# in $a0 este deja cifra care trebuie afisata
	
	addi a1, a0, 48		# conversie la caracter 

	li a0, 11				# apel serviciu sistem de operare pentru afisare caracter 
	ecall
	
	lw ra, 0(sp)			# restaurare valoare registru din stiva
	lw s0, 4(sp)			# restaurare valoare registru din stiva
	lw s1, 8(sp)			# restaurare valoare registru din stiva
	addi sp, sp, 12			# refacere stiva
	jalr zero ra 0 			# revenire din procedura

