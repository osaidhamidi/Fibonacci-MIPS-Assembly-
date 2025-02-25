.data
    msg1: .asciiz "Enter n: "
    msg2: .asciiz "Fib(n) = "

.text
.globl main

fib:	
    add $sp, $sp, -12
	sw $s1, 8($sp)
	sw $s0, 4($sp)
	sw $ra, 0($sp)
	
	
	
	add $s0, $a0, $zero
	beq $zero, $s0, done
	addi $t0, $zero, 1
	beq $t0, $s0, done
	
	addi $a0, $s0, -1
	jal	fib
	add $s1, $v0, $zero
	addi $a0, $s0, -2
	jal fib
	add	$v0, $v0, $s1
	j finish
	
done:	
    add	$v0, $zero, $s0
	j finish
	
finish: 
    lw $ra, 0($sp)
	lw $s0, 4($sp)
    lw $s1, 8($sp)
	
	
	addi $sp, $sp, 12
	jr	$ra
	

main:
    
    li $v0, 4           
    la $a0, msg1   
    syscall   # "Enter n"          

    
    li $v0, 5           
    syscall             
    add $a0, $zero, $v0       
    
    jal fib             

    add $s0, $v0, $zero # save return value
	
    li $v0, 4           
    la $a0, msg2      
    syscall  # "Fib(n) = "            

	
    li $v0, 1           
    add $a0, $zero, $s0       
    syscall       
    li $v0, 10 
    syscall
