### Justin Baum
### 00426510
### Double Jump
### 25 November 2018
### Dr. Song Wang

.data

string1:  .asciiz "Trying Double Jump\n"
string2:  .asciiz "A\n" 
string3:  .asciiz "B\n" 
string4:  .asciiz "C\n"
string5:  .asciiz "Exit\n"

.text

main:
    # Input i to $s1
    addi $v0, $zero, 4  # code for printing string is 4 
    la $a0, string1 	# load address of string to be printed into $a0    
    syscall         	# call operating system 
    
    jal Single          # Jump to Single, put $sp in $ra
    
    j Exit

Single:
    addi $v0, $zero, 4  # code for printing string is 4 
    la $a0, string2 	# load address of string to be printed into $a0    
    syscall         	# call operating system
    
    sw $ra, 0($sp)	    # Store $ra on stack
    addiu $sp, $sp, -4	# Move stack
    
    jal Double          # Jump to Double, put $sp in $ra

    addi $v0, $zero, 4  # code for printing string is 4 
    la $a0, string4 	# load address of string to be printed into $a0    
    syscall         	# call operating system
    
    addiu $sp, $sp, 4	# Move stack
    lw $t7, 0($sp)	    # Get address from stack
    add $ra, $t7, $zero	# Load from stack
    jr $ra		        # Jump to address

Double:
    addi $v0, $zero, 4  # code for printing string is 4 
    la $a0, string3 	# load address of string to be printed into $a0    
    syscall         	# call operating system
    
    jr $ra		        # Return
    
  
Exit:				   											   											
    addi $v0, $zero, 4  # code for printing string is 4 
    la $a0, string5 	# load address of string to be printed into $a0    
    syscall         	# call operating system
    
    # exit	
    addi $v0, $zero, 10
    syscall 

		

