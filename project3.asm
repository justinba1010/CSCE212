### Justin Baum
### 00426510
### Project 3
### October 31 2018
### Dr. Song Wang

.data
OddArray:  .space 100
EvenArray: .space 100

string1:  .asciiz "Input a Number:\n" 
string2:  .asciiz "\n Odd #'s: " 
string3:  .asciiz "\n Even #'s: " 
string4:  .asciiz ", "

.text
main:	
		addi $s2, $zero, 99999	# Indicator for stop input new number
		addi $s3, $zero, 0	# Initialize # of input odd numbers
		addi $s4, $zero, 0	# Initialize # of input even numbers
		la $s5, OddArray	# BaseAddress of Odd Array
		la $s6, EvenArray	# BaseAddress of Even Array
		
		# Read input number until 99999 is input. 99999 is the indicator of the end and it will not be counted as an input number.
InputLoop:	
		addi $v0, $zero, 4      # code for printing string is 4 
      		la $a0, string1 	# load address of string to be printed into $a0    
      		syscall         	# call operating system 
		addi $v0, $zero, 5      # code for reading integer is 5 
   		syscall           	# call operating system
   		add $s1, $v0, $zero  	# input into $s1
   		
   		beq $s1, $s2, ExitLoop  # No more input if 99999 is input
   			
  			
   		# You write code here to decide whether the input is odd or even
   		
   		andi $t1, $s1, 1	# Get if this is even or odd
   		jal OddEven		# Jump and return eventually from OddEven subroutine
   		# If it is odd, store into the odd array, move to the next space and increase $s3, the count of the odd numbers.
   		# If it is even, store into the even array, move to the next space and increase $s4, the count of the even numbers.
		j InputLoop

OddEven:
		beqz $t1, Even
		j Odd
Even:
		sw $s1, 0($s6)		# EvenArray[4i] = 32 bits from input
		addi $s6, $s6, 4	# Increment Address Space
		addi $s4, $s4, 1	# Incrmement Count
		jr $ra
Odd:
		sw $s1, 0($s5)		# EvenArray[4i] = 32 bits from input
		addi $s5, $s5, 4	# Increment Address Space
		addi $s3, $s3, 1	# Incrmement Count
		jr $ra

ExitLoop:
		addi $v0, $zero, 4      # code for printing string is 4 
      		la $a0, string2 	# load address of string to be printed into $a0    
      		syscall
      		
      		
      		### Note it is a lot easier to read this out in reverse order, but I didn't know if you wanted reverse, so I made it forwards
      		la $s5, OddArray	# Load address of OddArray
      		addi $s5, $s5, -4	# Start at -1, because I am lazy
      		
      		jal PrintOdds

 		     		
		addi $v0, $zero, 4      # code for printing string is 4 
      		la $a0, string3 	# load address of string to be printed into $a0    
      		syscall
      		
      		### Note it is a lot easier to read this out in reverse order, but I didn't know if you wanted reverse, so I made it forwards
      		la $s6, EvenArray	# Load address of EvenArray
      		addi $s6, $s6, -4	# Start at -1, That's how life goes.
      		
      		jal PrintEvens
      		# You write the code here to print out the even numbers in the EvenArray. This is basically a for loop over $s4 elements in EvenArray.
		# The printed numbers are separted by ', ' as in string4 defined above.
		
		# exit	
		addi $v0, $zero, 10
		syscall 

PrintEvens:
		beqz $s4, JR		# We want to go back when we're done counting down
		addi $s4, $s4, -1	# Subtract our count by 1
		addi $s6, $s6, 4	# Subtract our address by 4
		lw $a0, 0($s6)		# Load our integer
		addi $v0, $zero, 1      # code for printing integer is 1
      		syscall
      		addi $v0, $zero, 4      # code for printing string is 4 
      		la $a0, string4 	# load address of string to be printed into $a0    
      		syscall  
      		j PrintEvens
      		
PrintOdds:
		beqz $s3, JR		# We want to go back when we're done counting down
		addi $s3, $s3, -1	# Subtract our count by 1
		addi $s5, $s5, 4	# Subtract our address by 4
		lw $a0, 0($s5)		# Load our integer
		addi $v0, $zero, 1      # code for printing integer is 1
      		syscall
      		addi $v0, $zero, 4      # code for printing string is 4 
      		la $a0, string4 	# load address of string to be printed into $a0    
      		syscall  
      		j PrintOdds

JR:
		jr $ra
		

