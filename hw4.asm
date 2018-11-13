### Justin Baum
### 00426510
### Homework 4
### November 13 2018
### Dr. Song Wang


# Question 1
#	1. Convert the following C program to MIPS assembly code
#	a=0.0; i=10;
#	while (i>0) {i=i-1; a=a*B[i];}
#	where a is a single-precision floating-point number stored in register $f0,
#	i is an integer stored in register $s0, and B is a single-precision floating-point array
#	with starting address stored in register $s1.

.data

# B:  .word 0x16936393 0x239198c4 0x848183ea 0xa41ddfa2 0x758399c3 0x714939f9 0xfd0b8a28 0xcf1b087a 0xb7990f2a 0x9c586317 # Random floating point(single precision)
A:  .word 0x0

.text
	# Put 0.0 in FPNum
	la $s5, A		# Load address of A
#	la $s6, B		# Debug
	add.s $f0, $f0, $f0	# a = 0.0
	addi $s0, $zero, 10	# i = 10
	jal Loop
#	j Exit			# Debug

Loop:
	ble $s0, $zero, JR 	# When i <= 0 go to JR
	addi $s0, $s0, -1	# i = i - 1
	add $t0, $s0, $s0	# 2i
	add $t0, $t0, $t0	# 4i
	add $t0, $s6, $t0	# address of B[i]
	lwc1 $f1, 0($s6)	# load value of B[1] -> $f1
	mul.s $f0, $f0, $f1	# a = a*B[1]
	j Loop

JR:
	jr $ra

# DEBUG CODE

# Exit:
#		addi $v0, $zero, 2      # code for printing FP number is 2
#		add.s $f12, $f0, $f1 
#		syscall           	# call operating system  
  			  		
#		addi $v0, $zero, 10
#		syscall 

# Question 2
# Calculate 14/3 using the optimized algorithm for integer division learned in the class.
# Write the solution in a tabular form as shown in the course slides.
# Here we assume both integers are in 4 bits.

# 14 = 1110
# 3 = 0011
#     __________________________________	Step 1
# 0011|1110.0000000000000000000000000000
#     -11
#      0010.0000000000000000000000000000
#     __1_______________________________	Step 2
# 0011|0010.0000000000000000000000000000
#      -00
#      0010.0000000000000000000000000000
#     __10______________________________	Step 3
# 0011|0010.0000000000000000000000000000
#       -00
#      0010.0000000000000000000000000000
#     __100_____________________________	Step 4
# 0011|0010.0000000000000000000000000000
#        -1.1
#      0000.1000000000000000000000000000
#     __100.1___________________________	Step 5
# 0011|0000.1000000000000000000000000000
#  This is the same as step 2 but shifted right by 3, so the repeating binary float is
#  100.1001001001001001001001001001
# 1.001001001001001001001001001001 x 2^2

# Question 3
# Calculate 3*14 using the optimized algorithm for integer multiplication learned in the class.
# Write the solution in a tabular form as shown in the course slides.
# Here we assume both integers are in 4 bits.

# 14 = 1110
# 3 = 0011

#        1110
#       x0011
# ------------
#        1110
#       11100
#      000000
#     0000000
# ------------
#      101010


# Question 4
# 4. In the following two cases, find out whether there will be an overflow exception after the instruction
# add $t0, $t1, $t2
# Explain why.
#	1) The numbers in $t1 and $t2 are 0xA0000002 and 0xA0000002, respectively.
#	2) The numbers in $t1 and $t2 are 0xA0000002 and 0x7FFFFFF2, respectively.

# Add 0xA0000002 and 0xA0000002
# 0b 1010 0000 0000 0000 0000 0000 0000 0010
# 0b 1010 0000 0000 0000 0000 0000 0000 0010
# ------------------------------------------
# 0b 0100 0000 0000 0000 0000 0000 0000 0100
# Yes there is an overflow

# Add  0xA0000002 and 0x7FFFFFF2
# 0b 1010 0000 0000 0000 0000 0000 0000 0010
# 0b 0111 1111 1111 1111 1111 1111 1111 0010
# ------------------------------------------
# 0b 0001 1111 1111 1111 1111 1111 1111 0100 
# Yes there is also an overflow