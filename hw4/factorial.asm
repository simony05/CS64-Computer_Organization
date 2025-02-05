# factorial.asm program
# CS 64, Z.Matni
#
# Assembly (NON-RECURSIVE) version of:
#   unsigned int n, fn=1;
#   cout << "Enter a number:\n";
#   cin >> n;
#   for (int x = 2; x <= n; x++)
#       fn = fn * x;
#   cout << "Factorial of " << x << " is:\n" << fn << "\n";

#Data Area (i.e. memory setup directive)
.data
	string1:	.asciiz	"Enter a number:\n"
	# TODO: Write the rest of the initializations here
	string2: .asciiz "Factorial of "
	string3: .asciiz " is:\n"
	newline: .asciiz "\n"

#Text Area (i.e. instructions/code directive)
.text
main:

	li $v0, 4
	la $a0, string1
	syscall
	li $v0, 5
	syscall
	move $t2, $v0
	move $t0, $v0
	li $t1, 1

loop:
    beq $t0, $zero, printsum
    mult $t1, $t0
	mflo $t1
    addi $t0, $t0, -1
    j loop

printsum: 
	li $v0, 4
	la $a0, string2
	syscall
	li $v0, 1
	move $a0, $t2
	syscall
	li $v0, 4
	la $a0, string3
	syscall
	move $a0, $t1
	li $v0, 1
	syscall
	li $v0, 4
	la $a0, newline
	syscall

exit:
	# TODO: Write code to properly exit a SPIM simulation
	li $v0, 10
	syscall
