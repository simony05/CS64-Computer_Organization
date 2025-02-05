# minimum.asm program
# CS 64, Z.Matni
#
# Get 3 integer inputs from the user (std.in)
# Reveal the minimum value
# See assignment description for details

#Data Area (i.e. memory setup directive)
.data
	# TODO: Complete these incomplete declarations / initializations

	nextnum: .asciiz "Enter the next number:\n"
    newline: .asciiz "\n"
	minimum: .asciiz "Minimum: "

#Text Area (i.e. instructions/code directive)
.text

main:
	li $v0, 4
	la $a0, nextnum
	syscall
	li $v0, 5
	syscall
	move $t0, $v0
	li $v0, 4
	la $a0, nextnum
	syscall
	li $v0, 5
	syscall
	move $t1, $v0
	li $v0, 4
	la $a0, nextnum
	syscall
	li $v0, 5
	syscall
	move $t2, $v0

	# t0 < t1, go to zero
	blt $t0, $t1, zero
	# else t1 < t2, go to one
	blt $t1, $t2, one
	# t2 smallest
	j two

zero:
	# t2 < t0
	blt $t2, $t0, two
	# t0 < t2
	move $a0, $t0
	j exit

one:
	move $a0, $t1
	j exit

two:
	move $a0, $t2
	j exit

exit:
	move $t0, $a0

	li $v0, 4
	la $a0, minimum
	syscall

	move $a0, $t0
	li $v0, 1
	syscall

	li $v0, 4
	la $a0, newline
	syscall

	li $v0, 10
	syscall
