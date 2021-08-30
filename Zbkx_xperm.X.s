	.file	"Zbkx_xperm.X.c"
	.option nopic
	.text
	.align	1
	.globl	xperm_b
	.type	xperm_b, @function
xperm_b:
#APP
# 3 "Zbkx_xperm.X.c" 1
	xperm.b    a0, a0, a1
# 0 "" 2
#NO_APP
	ret
	.size	xperm_b, .-xperm_b
	.align	1
	.globl	xperm_n
	.type	xperm_n, @function
xperm_n:
#APP
# 9 "Zbkx_xperm.X.c" 1
	xperm.n    a0, a0, a1
# 0 "" 2
#NO_APP
	ret
	.size	xperm_n, .-xperm_n
	.section	.text.startup,"ax",@progbits
	.align	1
	.globl	main
	.type	main, @function
main:
	lui	a3,%hi(.LC0)
	ld	a3,%lo(.LC0)(a3)
	lui	a4,%hi(.LC1)
	ld	a4,%lo(.LC1)(a4)
	lui	a5,%hi(.LC2)
	addi	sp,sp,-48
	ld	a5,%lo(.LC2)(a5)
	sd	a3,8(sp)
	sd	a4,16(sp)
	sd	a5,24(sp)
	ld	a0,8(sp)
	ld	a1,16(sp)
	sd	ra,40(sp)
	call	xperm_b
	lui	a5,%hi(.LC3)
	ld	a4,%lo(.LC3)(a5)
	li	a5,1
	bne	a0,a4,.L5
	ld	a0,8(sp)
	ld	a1,24(sp)
	call	xperm_n
	lui	a5,%hi(.LC4)
	ld	a4,%lo(.LC4)(a5)
	li	a5,0
	bne	a0,a4,.L9
.L5:
	ld	ra,40(sp)
	mv	a0,a5
	addi	sp,sp,48
	jr	ra
.L9:
	li	a5,2
	j	.L5
	.size	main, .-main
	.section	.srodata.cst8,"aM",@progbits,8
	.align	3
.LC0:
	.dword	-2401053092306725256
	.align	3
.LC1:
	.dword	360852019805750018
	.align	3
.LC2:
	.dword	1234567891234121346
	.align	3
.LC3:
	.dword	-4741069434312584652
	.align	3
.LC4:
	.dword	8603696993698439926
	.ident	"GCC: (GNU) 10.2.0"
	.section	.note.GNU-stack,"",@progbits
