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
		
   		#baseadd of the array to $s5
   		la $s5, baseadd    	
  		
   		# Write code here to load A[i] to $s3
   		# Print A[i] from $s3	
   		addi $v0, $zero, 4      # code for printing string is 4 
      		la $a0, string3 	# load address of string to be printed into $a0    
      		syscall         	# call operating system 								   											   											
		add $a0, $s3, $zero	
		addi $v0,$zero,1	# prints integer
		syscall

		# Write code here to load and print A[j]	  
						
		# Write code here to compute and print A[i]+A[j]	  

 		# Write code here to compute and print A[i]-A[j]	  
			
		# exit	
		addi $v0, $zero, 10
		syscall 

		

