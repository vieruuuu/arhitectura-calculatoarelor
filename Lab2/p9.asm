.data
  len: .word 4
  a: .word 10, 20, 30, 40

.text
  # t0 acum are adresa lui len
  la t0, len 
  lw t1, 0(t0)
  
  mv t4, t1
  srli t1, t1, 1 # t1 = t1 / 2


  # pune valoarea adresei de inceput a tabloului a in registrul t2	
  la t0, a 
  add t2, t0, zero
  mv t6, t2
  andi t3, t3, 0

  loop:
    # t0 = t2[0]
    lw t0, 0(t2)

    sub t5, t4, t3
    addi t5, t5, -1
    slli t5, t5, 2
    add t5, t5, t6

    lw s0, 0(t5) # s0 = t5[0]
    sw t0, 0(t5) # t5[0] = t0
    sw s0, 0(t2) # t2[0] = s0

    addi t3, t3, 1
    addi t2, t2, 4
    addi t1, t1, -1

    bne zero, t1, loop

  nop
  nop
