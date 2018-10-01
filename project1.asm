### Justin Baum
### 00426510
### Project 1
### September 29 2018
### Dr. Song Wang


.data
baseadd:  .word 34, 5, 11, -12, 60, -2, 14, 71, 13, -27

string1:  .asciiz "Index i [0~9]:\n" 
string2:  .asciiz "Index j [0~9]:\n" 
string3:  .asciiz "\n A[i]=" 
string4:  .asciiz "\n A[j]=" 
string5:  .asciiz "\n A[i]+A[j]=" 
string6:  .asciiz "\n A[i]-A[j]=" 


.text
main:	
		# Read input i to $s1
		addi $v0, $zero, 4      # code for printing string is 4 
      		la $a0, string1 	# load address of string to be printed into $a0    
      		syscall         	# call operating system 
		addi $v0, $zero, 5      # code for reading integer is 5 
   		syscall           	# call operating system
   		add $s1, $v0, $zero  	# i in $s1
 
 		# Read input j to $s2
		addi $v0, $zero, 4      # code for printing string is 4 
      		la $a0, string2 	# load address of string to be printed into $a0    
      		syscall         	# call operating system 
   		#  Write code here to read input j to $s2
   		addi $v0, $zero, 5      # code for reading integer is 5 
   		syscall           	# call operating system
   		add $s2, $v0, $zero  	# j in $s2
		
   		#baseadd of the array to $s5
   		la $s5, baseadd    	
  		
   		# Write code here to load A[i] to $s3
   		add $t7, $s1, $s1 	# 2i in $t7
   		add $t7, $t7, $t7	# 4i in $t7
   		add $t7, $s5, $t7	# address of A[i] in $t7
   		lw $s3, 0($t7)
   		
   		# Print A[i] from $s3	
   		addi $v0, $zero, 4      # code for printing string is 4 
      		la $a0, string3 	# load address of string to be printed into $a0    
      		syscall         	# call operating system 								   											   											
		add $a0, $s3, $zero	
		addi $v0,$zero,1	# prints integer
		syscall
		
		
		# Write code here to load A[i] to $s3
		
		# Get address for a[j]
		add $t7, $s2, $s2	# 2j in $t7
   		add $t7, $t7, $t7	# 4j in $t7
   		add $t7, $s5, $t7	# address of A[i] in $t7
   		lw $s4, 0($t7)
   		
   		# Print A[j] from $s4	
   		addi $v0, $zero, 4      # code for printing string is 4 
      		la $a0, string4 	# load address of string to be printed into $a0    
      		syscall         	# call operating system 								   											   											
		add $a0, $s4, $zero	# load integer to print
		addi $v0,$zero,1	# prints integer
		syscall

						
		# Write code here to compute and print A[i]+A[j]
		add $s6, $s3, $s4 	# $s6 = A[i] + A[j]
		addi $v0, $zero, 4 	# Printing
		la $a0, string5		# load address of string
		syscall			# call OS
		add $a0, $s6, $zero	# load integer to print(A[i]+A[j])
		addi $v0, $zero, 1	# print integer
		syscall			# OS

 		# Write code here to compute and print A[i]-A[j]
 		sub $s7, $s3, $s4	# $s7 = A[i] - A[j]
 		addi $v0, $zero, 4	# Printing
 		la $a0, string6		# load address of string
 		syscall			# OS
 		add $a0, $s7, $zero	# load integer to print (A[i]-A[j])
 		addi $v0, $zero, 1	# print integer
 		syscall
			
		# exit	
		addi $v0, $zero, 10
		syscall 

		

