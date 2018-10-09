### Justin Baum
### 00426510
### Project 2
### October 2 2018
### Dr. Song Wang


.data
baseadd:  .word 34, 5, 11, -12, 60, -2, 14, 71, 13, -27

string1:  .asciiz "Index i [0~9]:\n" 
string2:  .asciiz "\n MIN=" 
string3:  .asciiz "\n MAX=" 

.text
main:	
		# Input i to $s1
		addi $v0, $zero, 4      # code for printing string is 4 
      		la $a0, string1 	# load address of string to be printed into $a0    
      		syscall         	# call operating system 
		addi $v0, $zero, 5      # code for reading integer is 5 
   		syscall           	# call operating system
   		add $s1, $v0, $zero  	# i in $s1
    		
   		#baseadd of the array to $s5
   		la $s5, baseadd   
   		
   		#Load A[0] to initialize MIN ($s6) and MAX ($s7)
   		lw $s6, ($s5)
   		lw $s7, ($s5) 	
  		
  		# initialize j=0 (j in $t1)
  		add $t1, $zero, $zero
  		
  		# You write code here to implement the following C code.
 		# This will find the MIN ($s6) and MAX ($s7) 
 		# in the array from A[0] through A[i].
 		# Note that you need to use lw to load A[j].
 
   		# while (j<=i)
  		#	{
  		#	if A[j]<MIN
  		#		MIN=A[j];
  		#	if A[j]>MAX
  		#		MAX=A[j];
  		#	j=j+1;
  		#	}
 
  #### $s1 : i	$s5 : baseadd	$t1 : j	$s6 : min	$s7 : max
  
  Loop:
  		bge $t1, $s1, Exit 	# Halt when j > i
  		addi $s5, $s5, 4 	# Add 4 to address of baseadd
  		addi $t1, $t1, 1 	# Add 1 to j, to signify where we are
  		lw $t2, ($s5)		# Load A[j] to $t2
  		j MaxMin		# Jump to maxmin code
  MaxMin:
  		blt $t2, $s6, Min	# When A[x] < min, go to min
  		j Max			# Jump to Max
  Min:
  		add $s6, $zero, $t2	# Min = A[x]
  		j Max			# Jump to max
  Max:
  		blt $t2, $s7, Loop	# When A[x] < max, go to loop
  		add $s7, $zero, $t2	# ^ So A[x] >= max, we make max = A[x]
  		j Loop			# Jump back to loop
  
  
  
     		# Print MIN from s6	
  Exit: 	addi $v0, $zero, 4      # code for printing string is 4 
      		la $a0, string2 	# load address of string to be printed into $a0    
      		syscall         	# call operating system 								   											   											
		add $a0, $s6, $zero	
		addi $v0,$zero,1	# prints integer
		syscall

    		# Print MAX from s7	
   		addi $v0, $zero, 4      # code for printing string is 4 
      		la $a0, string3 	# load address of string to be printed into $a0    
      		syscall         	# call operating system 								   											   											
		add $a0, $s7, $zero	
		addi $v0,$zero,1	# prints integer
		syscall

		# exit	
		addi $v0, $zero, 10
		syscall 

		

