.data
newline: .asciiz "\n"  # Define a newline character

.text
.globl main

main:
    # Assign values to registers
    li $s0, 18   # a = 18
    li $s1, 8    # b = 8
    li $s2, 2    # c = 2
    li $s3, 5    # d = 5

    # Compute e = a - b + c - d
    sub $s4, $s0, $s1  # a - b
    add $s4, $s4, $s2  # (a - b) + c
    sub $s4, $s4, $s3  # (a - b + c) - d

    # Print e
    li $v0, 1        # Syscall to print integer
    move $a0, $s4    # Move e to $a0
    syscall

    # Print newline
    li $v0, 4
    la $a0, newline
    syscall

    # Compute f = a - c + (b - d)
    sub $s5, $s0, $s2  # a - c
    sub $t0, $s1, $s3  # b - d
    add $s5, $s5, $t0  # (a - c) + (b - d)

    # Print f
    li $v0, 1
    move $a0, $s5
    syscall

    # Print newline
    li $v0, 4
    la $a0, newline
    syscall

    # Compute g = d * e
    mul $s6, $s3, $s4  # g = d * e

    # Print g
    li $v0, 1
    move $a0, $s6
    syscall

    # Print newline
    li $v0, 4
    la $a0, newline
    syscall

    # Exit program
    li $v0, 10
    syscall
