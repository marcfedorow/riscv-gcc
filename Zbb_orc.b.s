	.file	"Zbb_orc.b.c"
	.option nopic
	.text
	.align	1
	.globl	orc_b
	.type	orc_b, @function
orc_b:
#APP
# 4 "Zbb_orc.b.c" 1
	orc.b    a0, a0
# 0 "" 2
#NO_APP
	ret
	.size	orc_b, .-orc_b
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
	call	orc_b
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
	.dword	1225016701083468885
	.align	3
.LC1:
	.dword	-71776123356119041
	.ident	"GCC: (GNU) 10.2.0"
	.section	.note.GNU-stack,"",@progbits
