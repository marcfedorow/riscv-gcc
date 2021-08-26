	.file	"Zba_add.uw.c"
	.option nopic
	.text
	.section	.text.startup,"ax",@progbits
	.align	1
	.globl	main
	.type	main, @function
main:
	addi	sp,sp,-16
	li	a5,10
	sd	a5,0(sp)
	li	a5,1
	slli	a5,a5,31
	sd	a5,8(sp)
	ld	a0,8(sp)
	ld	a5,0(sp)
	addi	sp,sp,16
	add.uw	a0,a0,a5
	li	a5,-2147483648
	addi	a5,a5,-10
	add	a0,a0,a5
	snez	a0,a0
	jr	ra
	.size	main, .-main
	.ident	"GCC: (GNU) 10.2.0"
	.section	.note.GNU-stack,"",@progbits
