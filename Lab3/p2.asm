.data
  array: .word 2 2 2 5 5 5 5
  len: .word 7

.text

main:
  la s0, array

  la t0, len
  lw s3, 0(t0) # s3 = lugimea vect

  slli s1, s3, 2 # fac s1 sa fie in octeti
  jal ra, count_even_array

  j stop

count_even_array:
  add t3, zero, zero

loop:
  ble s1, zero, count_even_array_return

  addi s1, s1, -4
  add t1, s0, s1
  lw t0, 0(t1)

  andi t0, t0, 1
  add t3, t3, t0

  j loop
count_even_array_return:
  sub s0, s3, t3
  # mut in a0 sa imi arate error code -> nr de numere pare
  add a0, s0, zero

  jalr zero, ra, 0


stop:
  nop