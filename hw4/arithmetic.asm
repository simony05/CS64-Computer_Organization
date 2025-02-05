# arithmetic.asm program
# CS 64, Z.Matni
#
# 1. Prompt the user for 3 inputs: a, b, c
# 2. Calculate 64*( 4*b – a) + 5*c using only one mult instruction
# 3. Print out the result

.text
main:
	li $v0, 5
	syscall
	move $t0, $v0
	li $v0, 5
	syscall
	sll $v0, $v0, 2
	sub $t0, $v0, $t0
	sll $t0, $t0, 6
	li $v0, 5
	syscall
	li $t1, 5
	mult $v0, $t1
	mflo $v0
	add $a0, $t0, $v0

exit:
	li $v0, 1
	syscall

	li $v0, 10
	syscall

