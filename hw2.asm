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
.data
addr: .word 451870720

.text
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

# Loop address 		0x1AEF 0000
# Exit address		0x1AEF 0018

# J command Work
# j = opcode 000010
# Target =      0x1AEF0000
# To binary
# Target =      0b 0001 1010 1110 1111 0000 0000 0000 0000
# Drop first 4 bits
# Target =      0b      1010 1110 1111 0000 0000 0000 0000
# Started with 32 bits, down to 28 bits
# Bit shift right(it will bitshift left because addresses are done in words which are multiples of 4 bytes)
# Target =      0b        10 1011 1011 1100 0000 0000 0000
# Add opcode =  0b 0000 10
# Instruction = 0b 0000 1010 1011 1011 1100 0000 0000 0000
# Change to hex
# Instruction = 0x 0    A    B    B    C    0    0    0
# Instruction = 0x0ABB C000

# Check backwards to double check
# Instruction = 0b 0000 1010 1011 1011 1100 0000 0000 0000
# Remove opcode 0b	  10 1011 1011 1100 0000 0000 0000
# Shift left	0b 	1010 1110 1111 0000 0000 0000 0000
# Add from PC	0b 0001 1010 1110 1111 0000 0000 0000 0000
# Check addr	0x 1 	A    E    F    0    0    0    0
# Address	0x1AEF 0000
# Looks good to me

# Address       Assembly            	Hexadecimal

# 0x1AEF 0000   lw $t0, 0($s0)	    	0x8e08 0000
# 0x1AEF 0004   addi $t1, $t1, -5	0x2129 fffb
# 0x1AEF 0008   srl $t1, $t1, 2	    	0x0009 4882
# 0x1AEF 000C   beq $t1, $s5, Exit	0x1135 0002
# 0x1AEF 0010   addi $s0, $s0, 4	0x2210 0004
# 0x1AEF 0014   j Loop		        0x0abb c000
# 0x1AEF 0018   addi $v0, $zero, 10	0x2002 000a
# 0x1AEF 001C   syscall 		0x0000 000c

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
# Fx code is 0x20
# Now we have the command 	add rd, rs, rt
# To find rs, rt, rd, each are 5 bits, following opcode with 5 bits for shamt(for shifting)
# 0b000000 10000 10000 10000 00000 100000
# opcode     rs    rt   rd   ****   func
###########################################################
# add $s0, $s0, $s0