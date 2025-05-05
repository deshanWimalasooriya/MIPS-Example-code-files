# if (i == j)
#     f = g + h;
# else
#     f = g - h;
.data
newline: .asciiz "\n"  # Define a newline character
.text
.globl main

main:
    # Load values
    li $t0, 5        # $t0 = i
    li $t1, 5        # $t1 = j
    li $t2, 10       # $t2 = g
    li $t3, 3        # $t3 = h

    # add g+h
    add $t4, $t2, $t3  # $t4 = g + h

    #sub g-h
    sub $t5, $t2, $t3  # $t5 = g - h

    #print $t4
    li $v0, 1        # Syscall to print integer
    move $a0, $t4    # Move result to $a0
    syscall

    # Print newline
    li $v0, 4
    la $a0, newline
    syscall

    #print $t5
    li $v0, 1        # Syscall to print integer
    move $a0, $t5    # Move result to $a0
    syscall

    #exit
    li $v0, 10
    syscall
# The above code is a MIPS assembly program that demonstrates the use of conditional statements