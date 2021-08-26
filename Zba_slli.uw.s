	.file	"Zba_slli.uw.c"
	.option nopic
	.text
	.align	1
	.globl	slli_uw
	.type	slli_uw, @function
slli_uw:
	slli.uw	a0,a0,3
	ret
	.size	slli_uw, .-slli_uw
	.section	.text.startup,"ax",@progbits
	.align	1
	.globl	main
	.type	main, @function
main:
	addi	sp,sp,-16
	li	a5,10
	sd	a5,8(sp)
	ld	a0,8(sp)
	addi	sp,sp,16
	slli.uw	a0,a0,3
	addi	a0,a0,-80
	snez	a0,a0
	jr	ra
	.size	main, .-main
	.ident	"GCC: (GNU) 10.2.0"
	.section	.note.GNU-stack,"",@progbits
