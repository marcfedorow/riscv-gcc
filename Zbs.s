	.file	"Zbs.c"
	.option nopic
	.text
	.align	1
	.globl	bclr
	.type	bclr, @function
bclr:
#APP
# 3 "Zbs.c" 1
	bclr    a0, a0, a1
# 0 "" 2
#NO_APP
	ret
	.size	bclr, .-bclr
	.align	1
	.globl	bclri4
	.type	bclri4, @function
bclri4:
#APP
# 9 "Zbs.c" 1
	bclri    a0, a0, 4
# 0 "" 2
#NO_APP
	ret
	.size	bclri4, .-bclri4
	.align	1
	.globl	bext
	.type	bext, @function
bext:
#APP
# 15 "Zbs.c" 1
	bext    a0, a0, a1
# 0 "" 2
#NO_APP
	ret
	.size	bext, .-bext
	.align	1
	.globl	bexti4
	.type	bexti4, @function
bexti4:
#APP
# 21 "Zbs.c" 1
	bexti    a0, a0, 4
# 0 "" 2
#NO_APP
	ret
	.size	bexti4, .-bexti4
	.align	1
	.globl	binv
	.type	binv, @function
binv:
#APP
# 27 "Zbs.c" 1
	binv    a0, a0, a1
# 0 "" 2
#NO_APP
	ret
	.size	binv, .-binv
	.align	1
	.globl	binvi4
	.type	binvi4, @function
binvi4:
#APP
# 33 "Zbs.c" 1
	binvi    a0, a0, 4
# 0 "" 2
#NO_APP
	ret
	.size	binvi4, .-binvi4
	.align	1
	.globl	bset
	.type	bset, @function
bset:
#APP
# 39 "Zbs.c" 1
	bset    a0, a0, a1
# 0 "" 2
#NO_APP
	ret
	.size	bset, .-bset
	.align	1
	.globl	bseti61
	.type	bseti61, @function
bseti61:
#APP
# 45 "Zbs.c" 1
	bseti    a0, a0, 61
# 0 "" 2
#NO_APP
	ret
	.size	bseti61, .-bseti61
	.section	.text.startup,"ax",@progbits
	.align	1
	.globl	main
	.type	main, @function
main:
	addi	sp,sp,-64
	lui	a5,%hi(.LC0)
	sd	s1,40(sp)
	ld	s1,%lo(.LC0)(a5)
	li	a1,4
	sd	s2,32(sp)
	sd	s1,8(sp)
	ld	a0,8(sp)
	sd	ra,56(sp)
	sd	s0,48(sp)
	sd	s3,24(sp)
	call	bclr
	lui	a5,%hi(.LC1)
	ld	a5,%lo(.LC1)(a5)
	li	s2,1
	bne	a0,a5,.L11
	mv	s0,a0
	ld	a0,8(sp)
	li	a1,7
	call	bclr
	mv	s3,a0
	beq	a0,s1,.L25
.L11:
	ld	ra,56(sp)
	ld	s0,48(sp)
	ld	s1,40(sp)
	ld	s3,24(sp)
	mv	a0,s2
	ld	s2,32(sp)
	addi	sp,sp,64
	jr	ra
.L25:
	ld	a0,8(sp)
	call	bclri4
	mv	s1,a0
	bne	a0,s0,.L14
	ld	a0,8(sp)
	li	a1,63
	call	bext
	mv	s0,a0
	bne	a0,s2,.L16
	ld	a0,8(sp)
	li	a1,7
	call	bext
	bne	a0,zero,.L16
	ld	a0,8(sp)
	call	bexti4
	bne	a0,s0,.L17
	ld	a0,8(sp)
	li	a1,4
	call	binv
	mv	s0,a0
	bne	a0,s1,.L19
	ld	a0,8(sp)
	li	a1,7
	lui	s1,%hi(.LC2)
	call	binv
	ld	a5,%lo(.LC2)(s1)
	bne	a0,a5,.L19
	ld	a0,8(sp)
	call	binvi4
	bne	a0,s0,.L20
	ld	a0,8(sp)
	li	a1,4
	call	bset
	bne	a0,s3,.L22
	ld	a0,8(sp)
	li	a1,7
	call	bset
	ld	a5,%lo(.LC2)(s1)
	bne	a0,a5,.L22
	ld	a0,8(sp)
	li	s2,0
	call	bseti61
	lui	a5,%hi(.LC3)
	ld	a5,%lo(.LC3)(a5)
	beq	a0,a5,.L11
	li	s2,8
	j	.L11
.L14:
	li	s2,2
	j	.L11
.L16:
	li	s2,3
	j	.L11
.L19:
	li	s2,5
	j	.L11
.L17:
	li	s2,4
	j	.L11
.L22:
	li	s2,7
	j	.L11
.L20:
	li	s2,6
	j	.L11
	.size	main, .-main
	.section	.srodata.cst8,"aM",@progbits,8
	.align	3
.LC0:
	.dword	-2401053092306725256
	.align	3
.LC1:
	.dword	-2401053092306725272
	.align	3
.LC2:
	.dword	-2401053092306725128
	.align	3
.LC3:
	.dword	-95210083093031304
	.ident	"GCC: (GNU) 10.2.0"
	.section	.note.GNU-stack,"",@progbits
