# MIPS Program to perform:
# if (i == j)
#     f = g + h;
# else
#     f = g - h;

.data
f:      .word 0         # f = 0 (to store result)
newline: .asciiz "\n"   # newline for clean output

.text
.globl main

main:
    # Load variables into registers
    li $t0, 5           # $t0 = i
    li $t1, 6           # $t1 = j
    li $t2, 10          # $t2 = g
    li $t3, 3           # $t3 = h

    # Compare i and j
    beq $t0, $t1, equal_case

    # else part: f = g - h
    sub $t4, $t2, $t3
    sw $t4, f
    j end_if

equal_case:
    # if part: f = g + h
    add $t4, $t2, $t3
    sw $t4, f

end_if:
    # Print result f
    move $a0, $t4       # move result to $a0
    li $v0, 1           # print_int syscall
    syscall

    # Print newline
    li $v0, 4
    la $a0, newline
    syscall

    # Exit
    li $v0, 10
    syscall
