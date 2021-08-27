	.file	"Zbb_rotation.c"
	.option nopic
	.text
	.align	1
	.globl	rol
	.type	rol, @function
rol:
#APP
# 5 "Zbb_rotation.c" 1
	rol    a0, a0, a1
# 0 "" 2
#NO_APP
	ret
	.size	rol, .-rol
	.align	1
	.globl	rolw
	.type	rolw, @function
rolw:
#APP
# 11 "Zbb_rotation.c" 1
	rolw    a0, a0, a1
# 0 "" 2
#NO_APP
	ret
	.size	rolw, .-rolw
	.align	1
	.globl	ror
	.type	ror, @function
ror:
#APP
# 17 "Zbb_rotation.c" 1
	ror    a0, a0, a1
# 0 "" 2
#NO_APP
	ret
	.size	ror, .-ror
	.align	1
	.globl	rori_1
	.type	rori_1, @function
rori_1:
#APP
# 23 "Zbb_rotation.c" 1
	rori    a0, a0, 1
# 0 "" 2
#NO_APP
	ret
	.size	rori_1, .-rori_1
	.align	1
	.globl	roriw_1
	.type	roriw_1, @function
roriw_1:
#APP
# 29 "Zbb_rotation.c" 1
	roriw    a0, a0, 1
# 0 "" 2
#NO_APP
	ret
	.size	roriw_1, .-roriw_1
	.align	1
	.globl	rorw
	.type	rorw, @function
rorw:
#APP
# 35 "Zbb_rotation.c" 1
	rorw    a0, a0, a1
# 0 "" 2
#NO_APP
	ret
	.size	rorw, .-rorw
	.section	.text.startup,"ax",@progbits
	.align	1
	.globl	main
	.type	main, @function
main:
	lui	a5,%hi(.LC0)
	ld	a5,%lo(.LC0)(a5)
	addi	sp,sp,-32
	li	a1,1
	sd	a5,8(sp)
	ld	a0,8(sp)
	sd	ra,24(sp)
	sd	s0,16(sp)
	call	rol
	lui	a5,%hi(.LC1)
	ld	a4,%lo(.LC1)(a5)
	li	a5,1
	bne	a0,a4,.L9
	ld	a0,8(sp)
	li	a1,1
	call	rolw
	li	a5,16842752
	addi	a5,a5,257
	bne	a0,a5,.L11
	ld	a0,8(sp)
	li	a1,1
	call	ror
	lui	a5,%hi(.LC2)
	ld	a5,%lo(.LC2)(a5)
	mv	s0,a0
	bne	a0,a5,.L12
	ld	a0,8(sp)
	call	rori_1
	bne	a0,s0,.L13
	ld	a0,8(sp)
	call	roriw_1
	li	a5,1077952512
	addi	a5,a5,64
	mv	s0,a0
	bne	a0,a5,.L14
	ld	a0,8(sp)
	li	a1,1
	call	rorw
	li	a5,0
	bne	a0,s0,.L17
.L9:
	ld	ra,24(sp)
	ld	s0,16(sp)
	mv	a0,a5
	addi	sp,sp,32
	jr	ra
.L11:
	li	a5,2
	j	.L9
.L13:
	li	a5,4
	j	.L9
.L12:
	li	a5,3
	j	.L9
.L17:
	li	a5,6
	j	.L9
.L14:
	li	a5,5
	j	.L9
	.size	main, .-main
	.section	.srodata.cst8,"aM",@progbits,8
	.align	3
.LC0:
	.dword	-9187201950435737472
	.align	3
.LC1:
	.dword	72340172838076673
	.align	3
.LC2:
	.dword	4629771061636907072
	.ident	"GCC: (GNU) 10.2.0"
	.section	.note.GNU-stack,"",@progbits
