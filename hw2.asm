# Justin Baum
# 00426510

# Question 1:
# Convert 0Xfffffff9 (2’s complement representation) into decimal.
# 	=	0b1111 1111 1111 1111 1111 1111 1111 1111 1001
# 	=	0x0000 0000 0000 0000 0000 0000 0000 0000 0110
# 	= 	0x0000 0000 0000 0000 0000 0000 0000 0000 0111
#	=	-7

########################################################

# Question 2:
# In the following MIPS assembly code, translate all the instructions to their
# corresponding machine code in hexadecimal format. This code is stored in the
# memory from address 0x1aef0000.
Loop:
	lw $t0, 0($s0)
	addi $t1, $t1, -5
	srl $t1, $t1, 2
	beq $t1, $s5, Exit
	addi $s0, $s0, 4
	j Loop

Exit:
	addi $v0, $zero, 10
	syscall 
# Compiler

# Loop address 		0x0040 0000
# lw $t0, 0($s0)	0x8e08 0000
# addi $t1, $t1, -5	0x2129 fffb
# srl $t1, $t1, 2	0x0009 4882
# beq $t1, $s5, Exit	0x1135 0002
# addi $s0, $s0, 4	0x2210 0004
# j Loop		0x0810 0000

# Exit address		0x0040 0018
# addi $v0, $zero, 10	0x2002 000a
# syscall 		0x0000 000c

############################################################

# Question 3:
# Find the MIPS instruction with the machine code 0x02108020.

# 0x0    2    1    0    8    0    2    0
# To binary
# 0b0000 0010 0001 0000 1000 0000 0010 0000
# Format for opcode
# Opcode is first 6 bits
# 0b000000 10000100001000000000100000
# opcode is 0x0, lots of possibilities
# Find function code
# Function is last six bits
# 0b000000 10000100001000000000 100000
# Opcode is 0x20
# Now we have the command 	add rd, rs, rt
# To find rs, rt, rd, each are 5 bits, following opcode with 5 bits for shamt(for shifting)
# 0b000000 10000 10000 10000 00000 100000
# opcode     rs    rt   rd   ****   func
###########################################################
# add $s0, $s0, s0
