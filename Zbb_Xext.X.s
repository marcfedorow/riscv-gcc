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
	.align	1
	.globl	sext_h
	.type	sext_h, @function
sext_h:
	sext.h	a0,a0
	ret
	.size	sext_h, .-sext_h
	.align	1
	.globl	zext_h
	.type	zext_h, @function
zext_h:
	zext.h	a0,a0
	ret
	.size	zext_h, .-zext_h
	.section	.text.startup,"ax",@progbits
	.align	1
	.globl	main
	.type	main, @function
main:
	addi	sp,sp,-32
	sd	s0,16(sp)
	li	s0,32768
	addi	s0,s0,128
	sd	s0,8(sp)
	ld	a0,8(sp)
	sd	ra,24(sp)
	call	sext_b
	li	a4,-128
	li	a5,1
	bne	a0,a4,.L8
	ld	a0,8(sp)
	call	sext_h
	li	a5,-32768
	addi	a5,a5,128
	bne	a0,a5,.L10
	ld	a0,8(sp)
	call	zext_h
	li	a5,0
	bne	a0,s0,.L13
.L8:
	ld	ra,24(sp)
	ld	s0,16(sp)
	mv	a0,a5
	addi	sp,sp,32
	jr	ra
.L10:
	li	a5,2
	j	.L8
.L13:
	li	a5,3
	j	.L8
	.size	main, .-main
	.ident	"GCC: (GNU) 10.2.0"
	.section	.note.GNU-stack,"",@progbits
