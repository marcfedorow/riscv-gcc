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
	.section	.text.startup,"ax",@progbits
	.align	1
	.globl	main
	.type	main, @function
main:
	addi	sp,sp,-16
	li	a5,34
	sw	a5,8(sp)
	li	a3,56
	sw	a3,12(sp)
	lw	a5,8(sp)
	lw	a4,12(sp)
	li	a0,1
	sext.w	a5,a5
	sext.w	a4,a4
	max	a5,a5,a4
	bne	a5,a3,.L5
	lw	a0,8(sp)
	lw	a5,12(sp)
	sext.w	a0,a0
	sext.w	a5,a5
	min	a0,a0,a5
	addi	a0,a0,-34
	snez	a0,a0
.L5:
	addi	sp,sp,16
	jr	ra
	.size	main, .-main
	.ident	"GCC: (GNU) 10.2.0"
	.section	.note.GNU-stack,"",@progbits
