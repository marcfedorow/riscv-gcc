	.file	"Zbb_cpopX.c"
	.option nopic
	.text
	.align	1
	.globl	cpop
	.type	cpop, @function
cpop:
#APP
# 4 "Zbb_cpopX.c" 1
	cpop     a0, a0
# 0 "" 2
#NO_APP
	sext.w	a0,a0
	ret
	.size	cpop, .-cpop
	.align	1
	.globl	cpopw
	.type	cpopw, @function
cpopw:
#APP
# 10 "Zbb_cpopX.c" 1
	cpopw     a0, a0
# 0 "" 2
#NO_APP
	sext.w	a0,a0
	ret
	.size	cpopw, .-cpopw
	.section	.text.startup,"ax",@progbits
	.align	1
	.globl	main
	.type	main, @function
main:
	lui	a5,%hi(.LC0)
	ld	a5,%lo(.LC0)(a5)
	addi	sp,sp,-32
	sd	ra,24(sp)
	sd	a5,8(sp)
	ld	a0,8(sp)
	call	cpop
	li	a4,19
	li	a5,1
	bne	a0,a4,.L5
	ld	a0,8(sp)
	call	cpopw
	li	a4,17
	li	a5,0
	bne	a0,a4,.L9
.L5:
	ld	ra,24(sp)
	mv	a0,a5
	addi	sp,sp,32
	jr	ra
.L9:
	li	a5,2
	j	.L5
	.size	main, .-main
	.section	.srodata.cst8,"aM",@progbits,8
	.align	3
.LC0:
	.dword	211108161978352
	.ident	"GCC: (GNU) 10.2.0"
	.section	.note.GNU-stack,"",@progbits
