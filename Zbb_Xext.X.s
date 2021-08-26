	.file	"Zbb_Xext.X.c"
	.option nopic
	.text
	.align	1
	.globl	sext_b
	.type	sext_b, @function
sext_b:
	mv	a5,a0
	sext.b	a5,a5
	andi	a0,a0,255
	blt	a5,zero,.L4
	ret
.L4:
	ori	a0,a0,-256
	ret
	.size	sext_b, .-sext_b
	.section	.text.startup,"ax",@progbits
	.align	1
	.globl	main
	.type	main, @function
main:
	li	a5,32768
	addi	sp,sp,-32
	addi	a5,a5,128
	sd	a5,8(sp)
	ld	a0,8(sp)
	sd	ra,24(sp)
	call	sext_b
	ld	ra,24(sp)
	addi	a0,a0,128
	snez	a0,a0
	addi	sp,sp,32
	jr	ra
	.size	main, .-main
	.ident	"GCC: (GNU) 10.2.0"
	.section	.note.GNU-stack,"",@progbits
