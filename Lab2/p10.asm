.data
  len: .word 4
  a: .word 10, 20, 30, 40
  search: .word 30
  count: .word 0


.text
  # t0 acum are adresa lui len
  la t0, len 
  lw t1, 0(t0)

  la t0, search
  lw s0, 0(t0)

  
  la s2, count
  lw s3, 0(s2)


  # pune valoarea adresei de inceput a tabloului a in registrul t2	
  la t2, a 

  # t0 - elementul curent
  # t1 - marimea
  # t2 - adresa vectorului
  loop:
    lw t0, 0(t2)

    bne t0, s0, skip
    # daca sunt egale
    addi, s3, s3, 1
    sw s3, 0(s2)

    
    skip:
      addi t2, t2, 4
      addi t1, t1, -1
      bne zero, t1, loop
  nop
  nop
