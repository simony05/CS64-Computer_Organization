# print_array.asm program
# For CMPSC 64
#
# Don't forget to:
#   make all arguments to any function go in $a0 and/or $a1
#   make all returned values from functions go in $v0

.data
	array: .word 1 2 3 4 5 6 7 8 9 10
	cout:  .asciiz "The contents of the array are:\n"
	newline: .asciiz "\n"

.text
printArr:
	sll $t0, $a1, 2
	move $t1, $a0
	add $t0, $t0, $t1
	addi $t0, $t0, -4

loop: 
    ble $a1, 0, exitfunc

	li $v0, 1
	lw $a0, 0($t0)
	syscall

	li $v0, 4
	la $a0, newline
	syscall

	addi $t0, $t0, -4
	addi $a1, $a1, -1
	j loop

exitfunc:
	jr $ra


main:  # DO NOT MODIFY THE MAIN SECTION
	li $v0, 4
	la $a0, cout
	syscall

	la $a0, array
	li $a1, 10

	jal printArr

exit:
	# TODO: Write code to properly exit a SPIM simulation
	li $v0, 10
	syscall

