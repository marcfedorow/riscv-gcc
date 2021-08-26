	.file	"Zba_shXadd.X.c"
	.option nopic
	.text
	.align	1
	.globl	sh1add
	.type	sh1add, @function
sh1add:
	sh1add	a0,a0,a1
	ret
	.size	sh1add, .-sh1add
	.align	1
	.globl	sh1add_uw
	.type	sh1add_uw, @function
sh1add_uw:
	sh1add.uw	a0,a0,a1
	ret
	.size	sh1add_uw, .-sh1add_uw
	.align	1
	.globl	sh2add
	.type	sh2add, @function
sh2add:
	sh2add	a0,a0,a1
	ret
	.size	sh2add, .-sh2add
	.align	1
	.globl	sh2add_uw
	.type	sh2add_uw, @function
sh2add_uw:
	sh2add.uw	a0,a0,a1
	ret
	.size	sh2add_uw, .-sh2add_uw
	.align	1
	.globl	sh3add
	.type	sh3add, @function
sh3add:
	sh3add	a0,a0,a1
	ret
	.size	sh3add, .-sh3add
	.align	1
	.globl	sh3add_uw
	.type	sh3add_uw, @function
sh3add_uw:
	sh3add.uw	a0,a0,a1
	ret
	.size	sh3add_uw, .-sh3add_uw
	.section	.text.startup,"ax",@progbits
	.align	1
	.globl	main
	.type	main, @function
main:
	addi	sp,sp,-16
	li	a5,512
	sd	a5,0(sp)
	li	a5,10
	sd	a5,8(sp)
	ld	a5,0(sp)
	ld	a3,8(sp)
	li	a4,1034
	li	a0,1
	sh1add	a5,a5,a3
	bne	a5,a4,.L9
	ld	a4,0(sp)
	ld	a3,8(sp)
	sh1add.uw	a4,a4,a3
	bne	a4,a5,.L11
	ld	a5,0(sp)
	ld	a2,8(sp)
	li	a4,4096
	addi	a3,a4,-2038
	sh2add	a5,a5,a2
	bne	a5,a3,.L12
	ld	a3,0(sp)
	ld	a2,8(sp)
	sh2add.uw	a3,a3,a2
	bne	a3,a5,.L13
	ld	a5,0(sp)
	ld	a3,8(sp)
	addi	a4,a4,10
	sh3add	a5,a5,a3
	bne	a5,a4,.L14
	ld	a4,0(sp)
	ld	a3,8(sp)
	li	a0,0
	sh3add.uw	a4,a4,a3
	bne	a4,a5,.L17
.L9:
	addi	sp,sp,16
	jr	ra
.L11:
	li	a0,2
	j	.L9
.L13:
	li	a0,4
	j	.L9
.L12:
	li	a0,3
	j	.L9
.L17:
	li	a0,6
	j	.L9
.L14:
	li	a0,5
	j	.L9
	.size	main, .-main
	.ident	"GCC: (GNU) 10.2.0"
	.section	.note.GNU-stack,"",@progbits
