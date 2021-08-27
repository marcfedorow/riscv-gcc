	.file	"Zbc_clmulX.c"
	.option nopic
	.text
	.align	1
	.globl	clmul
	.type	clmul, @function
clmul:
#APP
# 3 "Zbc_clmulX.c" 1
	clmul    a0, a0, a1
# 0 "" 2
#NO_APP
	ret
	.size	clmul, .-clmul
	.align	1
	.globl	clmulh
	.type	clmulh, @function
clmulh:
#APP
# 9 "Zbc_clmulX.c" 1
	clmulh    a0, a0, a1
# 0 "" 2
#NO_APP
	ret
	.size	clmulh, .-clmulh
	.align	1
	.globl	clmulr
	.type	clmulr, @function
clmulr:
#APP
# 15 "Zbc_clmulX.c" 1
	clmulr    a0, a0, a1
# 0 "" 2
#NO_APP
	ret
	.size	clmulr, .-clmulr
	.section	.text.startup,"ax",@progbits
	.align	1
	.globl	main
	.type	main, @function
main:
	lui	a4,%hi(.LC0)
	ld	a4,%lo(.LC0)(a4)
	lui	a5,%hi(.LC1)
	ld	a5,%lo(.LC1)(a5)
	addi	sp,sp,-32
	sd	a4,0(sp)
	sd	a5,8(sp)
	ld	a0,0(sp)
	ld	a1,8(sp)
	sd	ra,24(sp)
	call	clmul
	lui	a5,%hi(.LC2)
	ld	a4,%lo(.LC2)(a5)
	li	a5,1
	bne	a0,a4,.L6
	ld	a0,0(sp)
	ld	a1,8(sp)
	call	clmulh
	lui	a5,%hi(.LC3)
	ld	a5,%lo(.LC3)(a5)
	bne	a0,a5,.L8
	ld	a0,0(sp)
	ld	a1,8(sp)
	call	clmulr
	lui	a5,%hi(.LC4)
	ld	a4,%lo(.LC4)(a5)
	li	a5,0
	bne	a0,a4,.L11
.L6:
	ld	ra,24(sp)
	mv	a0,a5
	addi	sp,sp,32
	jr	ra
.L8:
	li	a5,2
	j	.L6
.L11:
	li	a5,3
	j	.L6
	.size	main, .-main
	.section	.srodata.cst8,"aM",@progbits,8
	.align	3
.LC0:
	.dword	-56294136361780
	.align	3
.LC1:
	.dword	-2401053092306725256
	.align	3
.LC2:
	.dword	-5534675301261547488
	.align	3
.LC3:
	.dword	5360553418554935533
	.align	3
.LC4:
	.dword	-7725637236599680549
	.ident	"GCC: (GNU) 10.2.0"
	.section	.note.GNU-stack,"",@progbits
