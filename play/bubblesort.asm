### Justin Baum
### 00426510
### BubbleSort
### 25 November 2018
### Dr. Song Wang


.data
baseadd:  .word 34 5 11 11 0

.text
main:
    la $s1, baseadd		# a* => $s1

    ###############
    # void bubbleSort(int arr[], int n) { 
    #   int i, j; 
    #   for (i = 0; i < n-1; i++)       
    #       // Last i elements are already in place
    #       for (j = 0; j < n-i-1; j++)
    #           if (arr[j] > arr[j+1]) {
    #               int temp = a[i];
    #               int a[i] = a[j];
    #               int a[j] = temp;
    #           }
    #       }
    #   }
    ###############

    jal fori_init       # Go to fori and put $sp in $ra
    j Exit

fori_init:
    sw $ra, 0($sp)	    # Store $ra on stack
    addiu $sp, $sp, -4	# Move stack

    add $t0, $zero, $zero # i = 0
    j fori

fori:
    add $t6, $t0, $t0   # 2i
    add $t6, $t6, $t6   # 4i
    add $s0, $t6, $s1   # a[i]*
    lw $t6, 4($s0)      # a[i+1]
    beq $t6, $zero, bubbleJR # If a[j+2] == 0 goto bubbleJR
    jal forj_init
    addi $t0, $t0, 1    # i++
    j fori

forj_init:
    sw $ra, 0($sp)	    # Store $ra on stack
    addiu $sp, $sp, -4	# Move stack

    add $t1, $zero, $zero # j = 0       
    j forj

forj:
    add $t6, $t1, $t1   # 2j
    add $t6, $t6, $t6   # 4j
    add $s0, $t6, $s1   # a[j]*
    lw $t6, 8($s0)      # a[j+2]
    beq $t6, $zero, bubbleJR # If a[j+2] == 0 goto bubbleJR
    lw $t6, 0($s0)      # a[j]
    lw $t7, 4($s0)      # a[j+1]
    jal swap
    addi $t1, $t1, 1    #j++
    j forj

swap:
    bge $t7, $t6, regJR # if
    sw $t7, 0($s0)      # a[j] = a[j+1]
    sw $t6, 4($s0)      # a[j+1] = a[j]
    jr $ra

regJR:
    jr $ra

bubbleJR:
    addiu $sp, $sp, 4	# Move stack
    lw $t7, 0($sp)	    # Get address from stack
    add $ra, $t7, $zero	# Load from stack
    jr $ra		        # Jump to address


Exit:
    # exit	
    addi $v0, $zero, 10
    syscall 

