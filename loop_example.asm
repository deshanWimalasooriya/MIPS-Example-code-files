#while loop MIPS assembly example
#int i = 0;
#while (i < 10) {
#    i++;
#}

.data
i: .word 0         # i = 0 (to store result)
newline: .asciiz "\n"   # newline for clean output

.text
.globl main

main:
    lw $t0, i          # Load i into $t0

Loop:
    bge $t0, 10, EndLoop  # if i >= 10, exit loop
    addi $t0, $t0, 1   # i++
    sw $t0, i          # Store updated i

    # Print result i
    move $a0, $t0       # move result to $a0
    li $v0, 1
    syscall

    # print new line
    li $v0, 4
    la $a0, newline
    syscall
    
    j Loop             # Jump back to the start of the loop

EndLoop:
    #exit
    li $v0, 10
    syscall

# This program initializes a variable i to 0 and increments it in a loop until it reaches 10.
