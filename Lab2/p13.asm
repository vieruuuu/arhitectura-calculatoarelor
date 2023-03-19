.data
  len: .word 10
  len2: .word 3
  a: .asciiz "abb ab aab"
  lista: .asciiz "ac "
  count: .word 0
  sanki: .word 1 # 0 daca a mers, 1 daca nu a mers

.text
  # t0 acum are adresa lui len
  la t0, len 
  lw t1, 0(t0)

  la t0, len2
  lw t5, 0(t0)

  la t6, lista
  lb s0, 0(t6)

  la s2, count
  lw s3, 0(s2)


  # pune valoarea adresei de inceput a tabloului a in registrul t2	
  la t2, a 2

  # t0 - elementul curent
  # t1 - marimea
  # t2 - adresa vectorului
  loop:
    lb t0, 0(t2)

    bne t0, s0, skip
    # daca sunt egale
    addi, s3, s3, 1
    sw s3, 0(s2)

    skip:
      addi t2, t2, 1
      addi t1, t1, -1
      bne zero, t1, loop
  

    addi t6, t6, 1
    addi t5, t5, -1
    la t2, a 
    la t0, len 
    lw t1, 0(t0)
      
    lb s0, 0(t6)
    bne zero, t5, loop
    

  la t0, len 
  lw t1, 0(t0)
  bne t1, s3, gata


  la t0, sanki
  sw zero, 0(t0)

  gata:

  nop
  nop
