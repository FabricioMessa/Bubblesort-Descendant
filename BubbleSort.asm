.data
    	size: .word 10
    	lista: .word 2, 0, 3, 6, 12, 5, 1, 7, 8, 10, 4 
    	espacio: .asciiz " "
	fin: .asciiz "Fin del programa"
.text
        la $s0, lista
        lw $t4, size
reset:  li $t0, 0 
        li $t5, 0 
bubble:   add $s1, $s0, $t0
        lw $s3, ($s1)
        addi $t1, $t0, 4
        add $s2, $s0, $t1
        lw $s4, ($s2)
        bgt $s4, $s3, swapf
next:   addi $t5, $t5, 1
        addi $t0, $t0, 4
        beqz $t4, exit
        beq $t5, $t4, nummin
        j bubble
nummin: subi $t4, $t4, 1
        j reset
swapf:   sw $s3, ($s2)
        sw $s4, ($s1)
        j next
exit:   li $t0, 0
        li $t1, 0
bubble2:  li $v0, 1
        add $t2, $s0, $t1
        lw $a0, ($t2)
        syscall
        li $v0, 4
        la $a0, espacio
        syscall
        addi $t0, $t0, 1
        addi $t1, $t1, 4
        beq $t0, 10, done
        j bubble2
done:   li $v0, 4
        la $a0, fin
        syscall