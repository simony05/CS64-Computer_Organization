# DEMO FILE FOR CMSPC 64
# (c) Z. Matni, 2023
######################################
# simpleAdd.asm
#
# Adds 5 + 7 and prints result
######################################

.text
main:
    li $t0, 5 #addi $t0, $zero, 5
    li $t1, 7 #addi $t1, $zero, 7
    add $t2, $t0, $t1

# Print it out!
    li $v0, 1
    move $a0, $t2
    syscall

# Quit!
    li $v0, 10
    syscall
