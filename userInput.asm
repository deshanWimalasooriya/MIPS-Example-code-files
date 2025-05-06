.data
prompt:     .asciiz "Enter your name: "
output:     .asciiz "Your name is "
newline:    .asciiz "\n"
name:       .space 100   # reserve space for name input

.text
main:
    # Print the prompt
    li $v0, 4
    la $a0, prompt
    syscall

    # Read the string input from user
    li $v0, 8
    la $a0, name        # store input in 'name'
    li $a1, 100         # max characters to read
    syscall

    # Print "Your name is "
    li $v0, 4
    la $a0, output
    syscall

    # Print the name entered
    li $v0, 4
    la $a0, name
    syscall

    # Print newline
    li $v0, 4
    la $a0, newline
    syscall

    # Exit program
    li $v0, 10
    syscall
