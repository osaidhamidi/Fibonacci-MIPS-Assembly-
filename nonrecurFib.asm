.data
    msg1: .asciiz "Enter n: "
    msg2: .asciiz "Fib(n) = "

.text
.globl main

fib:
    ble $a0, $zero, done1  
    li $t6, 1
    beq $a0, $t6, done2  

    li $t0, 0 #prev
    li $t1, 1 # curr
    li $t2, 0 # next
    li $t3, 2  # i  = 2  

loop:
    bgt $t3, $a0, end

    add $t2, $t0, $t1
    add $t0, $t1, $zero
    add $t1, $t2, $zero

    addi $t3, $t3, 1
    j loop 

end:
    add $v0, $zero, $t2
    jr $ra

done1:
    add $v0, $zero, $t2
    jr $ra

done2:
    li $v0, 1
    jr $ra

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
