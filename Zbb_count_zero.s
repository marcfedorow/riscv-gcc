	.file	"Zbb_count_zero.c"
	.option nopic
	.text
	.align	1
	.globl	clz
	.type	clz, @function
clz:
#APP
# 4 "Zbb_count_zero.c" 1
	clz     a0, a0
# 0 "" 2
#NO_APP
	sext.w	a0,a0
	ret
	.size	clz, .-clz
	.align	1
	.globl	clzw
	.type	clzw, @function
clzw:
#APP
# 16 "Zbb_count_zero.c" 1
	clzw     a0, a0
# 0 "" 2
#NO_APP
	sext.w	a0,a0
	ret
	.size	clzw, .-clzw
	.align	1
	.globl	ctz
	.type	ctz, @function
ctz:
#APP
# 22 "Zbb_count_zero.c" 1
	ctz     a0, a0
# 0 "" 2
#NO_APP
	sext.w	a0,a0
	ret
	.size	ctz, .-ctz
	.align	1
	.globl	ctzw
	.type	ctzw, @function
ctzw:
#APP
# 28 "Zbb_count_zero.c" 1
	ctzw     a0, a0
# 0 "" 2
#NO_APP
	sext.w	a0,a0
	ret
	.size	ctzw, .-ctzw
	.section	.text.startup,"ax",@progbits
	.align	1
	.globl	main
	.type	main, @function
main:
	addi	sp,sp,-32
	li	a5,32768
	sd	a5,0(sp)
	bseti	a5,zero,36
	sd	a5,8(sp)
	ld	a0,0(sp)
	sd	ra,24(sp)
	call	clz
	li	a4,48
	li	a5,1
	bne	a0,a4,.L7
	ld	a0,0(sp)
	call	clzw
	li	a5,16
	bne	a0,a5,.L9
	ld	a0,0(sp)
	call	ctz
	li	a5,15
	bne	a0,a5,.L10
	ld	a0,8(sp)
	call	ctzw
	li	a4,32
	li	a5,0
	bne	a0,a4,.L13
.L7:
	ld	ra,24(sp)
	mv	a0,a5
	addi	sp,sp,32
	jr	ra
.L9:
	li	a5,2
	j	.L7
.L13:
	li	a5,4
	j	.L7
.L10:
	li	a5,3
	j	.L7
	.size	main, .-main
	.ident	"GCC: (GNU) 10.2.0"
	.section	.note.GNU-stack,"",@progbits
