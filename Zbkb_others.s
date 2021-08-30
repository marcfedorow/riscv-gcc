	.file	"Zbkb_others.c"
	.option nopic
	.text
	.align	1
	.globl	pack
	.type	pack, @function
pack:
#APP
# 3 "Zbkb_others.c" 1
	pack    a0, a0, a1
# 0 "" 2
#NO_APP
	ret
	.size	pack, .-pack
	.align	1
	.globl	packh
	.type	packh, @function
packh:
#APP
# 9 "Zbkb_others.c" 1
	packh    a0, a0, a1
# 0 "" 2
#NO_APP
	ret
	.size	packh, .-packh
	.align	1
	.globl	packw
	.type	packw, @function
packw:
#APP
# 15 "Zbkb_others.c" 1
	packw    a0, a0, a1
# 0 "" 2
#NO_APP
	ret
	.size	packw, .-packw
	.align	1
	.globl	rev_b
	.type	rev_b, @function
rev_b:
#APP
# 21 "Zbkb_others.c" 1
	rev.b    a0, a0
# 0 "" 2
#NO_APP
	ret
	.size	rev_b, .-rev_b
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
	call	pack
	lui	a5,%hi(.LC2)
	ld	a4,%lo(.LC2)(a5)
	li	a5,1
	bne	a0,a4,.L7
	ld	a0,0(sp)
	ld	a1,8(sp)
	call	packh
	li	a5,8192
	addi	a5,a5,376
	bne	a0,a5,.L9
	ld	a0,0(sp)
	ld	a1,8(sp)
	call	packw
	li	a5,1126256640
	addi	a5,a5,1656
	bne	a0,a5,.L10
	ld	a0,0(sp)
	call	rev_b
	lui	a5,%hi(.LC3)
	ld	a4,%lo(.LC3)(a5)
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
	.section	.srodata.cst8,"aM",@progbits,8
	.align	3
.LC0:
	.dword	-2401053092306725256
	.align	3
.LC1:
	.dword	-261456134192351
	.align	3
.LC2:
	.dword	-207665658309000
	.align	3
.LC3:
	.dword	8914169538471029278
	.ident	"GCC: (GNU) 10.2.0"
	.section	.note.GNU-stack,"",@progbits
