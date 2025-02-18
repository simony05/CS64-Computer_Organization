# conversion.asm program
# For CMPSC 64
#
# Don't forget to:
#   make all arguments to any function go in $a0 and/or $a1
#   make all returned values from functions go in $v0

.text
conv:
    # TODO: Write your function code here
    li $t0, 0
    li $t1, 8

loop: 
    beq $t1, $zero, exitfunc
    addi $t1, $t1, -1

    sll $t2, $a0, 3
    sub $t0, $t0, $t2
    add $t0, $t0, $a1

    blt $a0, 2, skip
    addi $a1, $a1, -1

skip: 
    addi $a0, $a0, 1
    j loop

exitfunc:
    move $v0, $t0
    jr $ra

main:  # DO NOT MODIFY THE MAIN SECTION
    li $a0, 5
    li $a1, 7

    jal conv

    move $a0, $v0
    li $v0, 1
    syscall

exit:
	# TODO: Write code to properly exit a SPIM simulation
    li $v0, 10
    syscall
