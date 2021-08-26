	.file	"Zbb_logical_XXn.c"
	.option nopic
	.text
	.align	1
	.globl	andn
	.type	andn, @function
andn:
	andn	a0,a0,a1
	ret
	.size	andn, .-andn
	.align	1
	.globl	orn
	.type	orn, @function
orn:
	orn	a0,a0,a1
	ret
	.size	orn, .-orn
	.align	1
	.globl	xorn
	.type	xorn, @function
xorn:
	xnor	a0,a0,a1
	ret
	.size	xorn, .-xorn
	.section	.text.startup,"ax",@progbits
	.align	1
	.globl	main
	.type	main, @function
main:
	addi	sp,sp,-32
	sd	s0,16(sp)
	li	s0,12
	sd	s0,0(sp)
	li	a5,34
	sd	a5,8(sp)
	ld	a0,0(sp)
	ld	a1,8(sp)
	sd	ra,24(sp)
	call	andn
	li	a5,1
	bne	a0,s0,.L6
	ld	a0,0(sp)
	ld	a1,8(sp)
	call	orn
	li	a5,-35
	bne	a0,a5,.L8
	ld	a0,0(sp)
	ld	a1,8(sp)
	call	xorn
	li	a4,-47
	li	a5,0
	bne	a0,a4,.L11
.L6:
	ld	ra,24(sp)
	ld	s0,16(sp)
	mv	a0,a5
	addi	sp,sp,32
	jr	ra
.L8:
	li	a5,2
	j	.L6
.L11:
	li	a5,3
	j	.L6
	.size	main, .-main
	.ident	"GCC: (GNU) 10.2.0"
	.section	.note.GNU-stack,"",@progbits
