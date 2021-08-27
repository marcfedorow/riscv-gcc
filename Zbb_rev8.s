	.file	"Zbb_rev8.c"
	.option nopic
	.text
	.align	1
	.globl	rev8
	.type	rev8, @function
rev8:
#APP
# 3 "Zbb_rev8.c" 1
	rev8    a0, a0
# 0 "" 2
#NO_APP
	ret
	.size	rev8, .-rev8
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
	call	rev8
	lui	a5,%hi(.LC1)
	ld	a5,%lo(.LC1)(a5)
	ld	ra,24(sp)
	sub	a0,a0,a5
	snez	a0,a0
	addi	sp,sp,32
	jr	ra
	.size	main, .-main
	.section	.srodata.cst8,"aM",@progbits,8
	.align	3
.LC0:
	.dword	1224981516711380053
	.align	3
.LC1:
	.dword	6144035792495968273
	.ident	"GCC: (GNU) 10.2.0"
	.section	.note.GNU-stack,"",@progbits
