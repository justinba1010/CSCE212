# Justin Baum
# 00426510

# Question 1:
# Please convert the decimal integer -23 to signed binary (32bit).
# 23 	=	0b0000 0000 0000 0000 0000 0000 0001 0111
# 23 	=	0x0000 0017
# -23 	=	flip 0b0000 0000 0000 0000 0000 0000 0001 0111 + 1
##########################################################3
# -23	=	0b1111 1111 1111 1111 1111 1111 1110 1001
# -23	=	0xFFFF FFE9


# Question 2:
# Question 2: Convert following C code to MIPS code
# A[i+1] = g + A[12] + 1;
# g, i are assigned to $s1, $t0 respectively
# Base address of integer array A is in $s0

main:
	lw $t4, 48($s0) # A[12]
	add $t4, $t4, $s1 # A[12] + g
	addi $t4, $t4, 1 # A[12] + g + 1
	# $t4 has right side of the equation
	add $t6, $t0, $t0 # 2i
	add $t6, $t6, $t6 # 4i
	add $t6, $s0, $t6 # address of A[i]
	addi $t6, $t6, 4 # address of A[i+1]
	sw $t4, 0($t6) # A[i] = g + A[12] + 1
