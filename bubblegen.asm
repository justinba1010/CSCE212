swap:
	lw	$2,0($4)
	lw	$3,0($5)
	nop
	sw	$3,0($4)
	jr $31
	movz	$31,$31,$0
	sw	$2,0($5)

	move	$3,$0
	addiu	$5,$5,-1
$L3:
	slt	$2,$3,$5
	beq	$2,$0,$L10
	move	$2,$4

	move	$6,$0
	subu	$9,$5,$3
$L7:
	slt	$7,$6,$9
	beq	$7,$0,$L9
	nop

	lw	$7,0($2)
	lw	$8,4($2)
	nop
	slt	$10,$8,$7
	beq	$10,$0,$L4
	nop

	sw	$8,0($2)
	sw	$7,4($2)
$L4:
	addiu	$6,$6,1
	b	$L7
	addiu	$2,$2,4

$L9:
	b	$L3
	addiu	$3,$3,1

$L10:
	jr	$31
	nop