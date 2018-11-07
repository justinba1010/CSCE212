### Justin Baum
### 00426510
### Homework 3
### 7 November 2018
### Dr. Song Wang

# Question 1 a&b
# P1 = 10 + 60 + 120 + 80 Cycles per 100 instructions = 270 => 2.7 Global CPI
# P2 = 40 + 100 + 180 + 80 Cycles per 100 instructions = 400 => 4 Global CPI
# P1 is faster because at 3 GHz it runs 3x10^9/2.7 = 1.11x10^9 instructions per second
# P2 is slower because at 4 GHz it runs 4x10^9/4.0 = 1.00x10^9 instructions per second

# Question 1 c
# Using Question 1a answers
# P1 => 10^4/1.11^9 = 9x10^-6 seconds
# P2 => 10^4/1.00^9 = 1x10^-5 seconds

# Question 2 a
# Cycles = 500 x 1 + 150 x 5 + 100 x 5 + 100 x 2
# Cycles = 500 + 750 + 500 + 200 = 1950
# Time to complete = 1950/2x10^9 = 9.75x10^-7 seconds to complete

# Question 2 b
# Global CPI = 1950/850 = 2.29 CPI

# Question 2 c
# Cycles = 500 x 1 + 150 x 5 + 50 x 5 + 100 x 2
# Cycles = 500 + 750 + 250 + 200 = 1700
# Time to complete = 1700/2x10^9 = 8.5x10^-7 seconds to complete, which is a 13% increase in speed
# Global CPI = 1700/800 = 2.125 CPI

# Question 2 d
# Cycles = 250 x 1 + 75 x 5 + 100 x 5 + 100 x 2
# Cycles = 250 + 375 + 500 + 200 = 1325
# Time to complete = 1325/2x10^9 = 6.625x10^-7 seconds to complete, which is a 32% increase in speed
# Global CPI = 1325/525 = 2.52 CPI

# Question 3
# Assume that the variables x and y are passed from argument registers $a0 and $a1 respectively.
# The returned value should be stored in register $v0. Note that you need to use stack to store any
# other registers if you use them in this procedure.

#   int leaf_procedure(int x, int y)
#   {
#       int i, a;
#       a=x+y;
#	i=x-2;
#       a=a+i;
#       return a;
#   }

# This is the same as return x+y+(x-2) = 2x+y-2, I'm just going to do that, save some CPU time
# I don't understand why we need a stack to be honest.
leaf_procedure:
	add $t1, $a0, $a0
	add $t1, $t1, $a1
	addi $v0, $t1, -2

# Question 4
# Convert the decimal number -27.0625 to equivalent IEEE 754 FP representation (single precision). Show the final result in hexadecimal format and your answer must include the steps. 
# -27.0625 = -1 * 27(11011)+1/16=(0.0001) => -1 * 11011.00010...0 => -1 * 1.10110001 x 2^4
# The first bit is the sign bit, the next 8 are the exponent, and the next 23 are the mantissa, we drop the leading one for the mantissa
# -1 sign       +4 exponent         .10110001 mantissa
# The next trick is we subtract 127 from the exponent so we must add it
# -1 sign       +131 exponent       .10110001...0 mantissa
# Now we can plug it in
# 0b 1          1000 0011             1011 0001 0000 0000 0000 000
# Put it all together
# 0b 1100 0001 1101 1000 1000 0000 0000 0000 
# 0x C1D8 8000

# Question 5
# Which decimal number does 0xC0A80000 (IEEE 754 FP single precision) represent? Your answer must include the steps.
# 0xC0A8 0000 to binary
# 0b 1100 0000 1010 1000 0000 0000 0000 0000
# Break it up, and add 1 to the front of the mantissa0
# 1 sign bit    10000001 exponent       010 1000 0000 0000 0000 0000 mantissa
# -1 x          2^(129-127)=2^2           1.0101
# -1            1.0101 x 2^2 => 101.01 = 5 + 0/2 + 1/4
# This number is -5.25
