.data
msg1: .asciiz "Enter first number: "
msg2: .asciiz "Enter second number: "
Result: .asciiz "The sum is: "
newline: .asciiz "\n"

.text
.globl main

main:
    # Print first msg
    li $v0, 4
    la $a0, msg1
    syscall

    # Read first number
    li $v0, 5
    syscall
    move $t0, $v0

    # Print second msg
    li $v0, 4
    la $a0, msg2
    syscall

    # Read second number
    li $v0, 5
    syscall
    move $t1, $v0

    jal add_numbers

    jal exit

add_numbers:
    add $t2, $t0, $t1  # Add the two numbers

    # Print result message
    li $v0, 4
    la $a0, Result
    syscall

    li $v0, 1
    move $a0, $t2
    syscall

    li $v0, 4
    la $a0, newline
    syscall
    jr $ra


exit:
    li $v0, 10 
    syscall

