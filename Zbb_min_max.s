	.file	"Zbb_min_max.c"
	.option nopic
	.text
	.align	1
	.globl	max
	.type	max, @function
max:
	max	a0,a1,a0
	ret
	.size	max, .-max
	.align	1
	.globl	min
	.type	min, @function
min:
	min	a0,a1,a0
	ret
	.size	min, .-min
	.align	1
	.globl	maxu
	.type	maxu, @function
maxu:
	maxu	a0,a1,a0
	ret
	.size	maxu, .-maxu
	.align	1
	.globl	minu
	.type	minu, @function
minu:
	minu	a0,a1,a0
	ret
	.size	minu, .-minu
	.section	.text.startup,"ax",@progbits
	.align	1
	.globl	main
	.type	main, @function
main:
	addi	sp,sp,-16
	li	a4,34
	sd	a4,0(sp)
	li	a3,-56
	sd	a3,8(sp)
	ld	a5,0(sp)
	ld	a2,8(sp)
	li	a0,1
	max	a5,a5,a2
	bne	a5,a4,.L7
	ld	a4,0(sp)
	ld	a2,8(sp)
	min	a4,a4,a2
	bne	a4,a3,.L9
	ld	a3,0(sp)
	ld	a2,8(sp)
	maxu	a3,a3,a2
	bne	a3,a4,.L10
	ld	a4,0(sp)
	ld	a3,8(sp)
	li	a0,0
	minu	a4,a4,a3
	bne	a4,a5,.L13
.L7:
	addi	sp,sp,16
	jr	ra
.L9:
	li	a0,2
	j	.L7
.L13:
	li	a0,4
	j	.L7
.L10:
	li	a0,3
	j	.L7
	.size	main, .-main
	.ident	"GCC: (GNU) 10.2.0"
	.section	.note.GNU-stack,"",@progbits
