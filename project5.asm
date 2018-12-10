### Justin Baum
### 00426510
### Project 5
### December 6 2018
### Dr. Song Wang

.data
FPNum: 		.word 0x0 # So I have a 0 to compare to and add

string1:	.asciiz "Input a Float-Point #:(0 indicates the end)\n"
string2:	.asciiz "These are the numbers in order:\n"
newline:	.asciiz "\n"

nums: 		.align 2
		    .space 4000

.text
main:	
    la $t0, FPNum
    la $s0, nums
    lwc1 $f10, ($t0) 	# $f10=0.0	
    lwc1 $f4, ($t0)		# SUM =0
            
    addi $s1, $zero, 0	# FP number counts in array 
    j InputLoop
    
    # Input a number 
InputLoop:	addi $v0, $zero, 4      # code for printing string is 4 
    la $a0, string1 	# load address of string to be printed into $a0    
    syscall         	# call operating system 
    addi $v0, $zero, 6  # code for reading FP number is 6 
    syscall           	# call operating system  

    add.s $f1, $f0, $f10	# move input fp number to $f1
    
    # Add this number to array
    add $t1, $s1, $s1	# 2i
    add $t1, $t1, $t1	# 4i
    add $t1, $t1, $s0	# a[i]*
    
            
    # Tasks:
    
    # 1) Add MIPS code to decide whether the input number is 0.0, 
    # which indicates the end of input FP numbers and jump out of the InputLoop	
    #(Currently there is no code to exit the loop)
    c.eq.s $f1, $f10	# Set flag to 1 if input = 0.0
    bc1t Sort
    s.s $f1, 0($t1)		# a[i] = fp 		  		
    addi $s1, $s1, 1
    j InputLoop
# I used bubblesort, I tried insertion and selection sort, but it was too many registers to handle in the end.
# This algorithm is very slow as far as sorting algorithms go
# This is the code I used
#int i, j; 
#	for (i = 0; i < n-1; i++)       
#		for (j = 0; j < n-i-1; j++)  
#			if (arr[j] > arr[j+1]) 
#				//SWAP THEM
#			}
#		}
#	} 
    
Sort:
    add $t2, $zero, $zero#set i to 0
    addi $s2, $s1, 0
    j fori
fori:
    bge $t2, $s2, beforefinish
    j setj
setj:
    add $t3, $zero, $zero#set j to 0
    addi $t7, $s1, -1	# set limit
    j forj
forj:
    bge $t3, $t7, interij#when done with forj loop: i++ then fori
    jal swap
    ####
    addi $t3, $t3, 1	#j++
    j forj
    
interij:
    addi $t2, $t2, 1	#i++
    j fori
swap:
    #### SORT CODE
    # Get address of j
    add $t4, $t3, $t3	#2j
    add $t4, $t4, $t4	#4j
    add $t4, $t4, $s0	#a[j]*
    l.s $f1, 0($t4)		#a[j]
    l.s $f2, 4($t4)		#a[j+1]
    c.lt.s $f2, $f1		#set bit if a[j+1] < a[j]
    bc1t doswap
    jr $ra
doswap:
    s.s $f1, 4($t4)		#a[j+1] = old a[j]
    s.s $f2, 0($t4)		#a[j] = old a[j+1]
    jr $ra
    
beforefinish:
    addi $v0, $zero, 4  # code for printing string is 4 
    la $a0, string2 	# load address of string to be printed into $a0    
    syscall         	# call operating system 
    j finish
finish:
    l.s $f1, 0($s0)		#f1 = a[i], i starts at 0
    c.eq.s $f1, $f10	# Check if it is 0
    bc1t exit		    # End
    addi $v0, $zero, 2  # code for printing FP number is 2
    add.s $f12, $f1, $f10 
    syscall           	# call operating system
    addi $v0, $zero, 4  # code for printing string is 4 
    la $a0, newline 	# load address of string to be printed into $a0    
    syscall         	# call operating system 
    addi $s0, $s0, 4	# Move to next a[i+1]
    j finish
exit:
    addi $v0, $zero, 10
    syscall 
		