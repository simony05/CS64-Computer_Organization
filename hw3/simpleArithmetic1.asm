# DEMO FILE FOR CMSPC 64
# (c) Z. Matni, 2023
######################################
# simpleArithmetic1.asm
######################################

.text
main:

# TODO: implement the arithmetic function: a - b + c, where a = 225, b = -22, c = -311.
#       Variables a, b, c, MUST be stored in registers $t0, $t1, $t2, respectively.
#       Think about which register the result should be stored in.
# YOUR ADDED LINES GO HERE:
        li $t0, 225
        li $t1, -22
        sub $t2, $t0, $t1
        addi $t3, $t2, -311
        move $a0, $t3


# DO NOT EDIT THE FOLLOWING INSTRUCTIONS!
# Print to std.output
        li $v0, 1
        syscall

# End program
        li $v0, 10
        syscall
		