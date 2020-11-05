	.section	__TEXT,__text,regular,pure_instructions
	.build_version macos, 10, 15	sdk_version 10, 15, 6
	.intel_syntax noprefix
	.section	__TEXT,__literal16,16byte_literals
	.p2align	4               ## -- Begin function tgc_sweep
LCPI0_0:
	.long	1127219200              ## 0x43300000
	.long	1160773632              ## 0x45300000
	.long	0                       ## 0x0
	.long	0                       ## 0x0
LCPI0_1:
	.quad	4841369599423283200     ## double 4503599627370496
	.quad	4985484787499139072     ## double 1.9342813113834067E+25
	.section	__TEXT,__literal8,8byte_literals
	.p2align	3
LCPI0_2:
	.quad	4890909195324358656     ## double 9.2233720368547758E+18
	.section	__TEXT,__text,regular,pure_instructions
	.globl	_tgc_sweep
	.p2align	4, 0x90
_tgc_sweep:                             ## @tgc_sweep
	.cfi_startproc
## %bb.0:
	push	rbp
	.cfi_def_cfa_offset 16
	.cfi_offset rbp, -16
	mov	rbp, rsp
	.cfi_def_cfa_register rbp
	push	r15
	push	r14
	push	r13
	push	r12
	push	rbx
	push	rax
	.cfi_offset rbx, -56
	.cfi_offset r12, -48
	.cfi_offset r13, -40
	.cfi_offset r14, -32
	.cfi_offset r15, -24
	cmp	qword ptr [rdi + 64], 0
	je	LBB0_27
## %bb.1:
	mov	r14, rdi
	mov	qword ptr [rdi + 88], 0
	mov	rax, qword ptr [rdi + 72]
	test	rax, rax
	je	LBB0_7
## %bb.2:
	mov	rcx, qword ptr [r14 + 32]
	add	rcx, 24
	xor	edx, edx
	jmp	LBB0_3
	.p2align	4, 0x90
LBB0_6:                                 ##   in Loop: Header=BB0_3 Depth=1
	inc	rdx
	add	rcx, 40
	cmp	rdx, rax
	jae	LBB0_7
LBB0_3:                                 ## =>This Inner Loop Header: Depth=1
	cmp	qword ptr [rcx], 0
	je	LBB0_6
## %bb.4:                               ##   in Loop: Header=BB0_3 Depth=1
	test	byte ptr [rcx - 16], 3
	jne	LBB0_6
## %bb.5:                               ##   in Loop: Header=BB0_3 Depth=1
	inc	qword ptr [r14 + 88]
	jmp	LBB0_6
LBB0_7:
	mov	rdi, qword ptr [r14 + 40]
	mov	rax, qword ptr [r14 + 88]
	shl	rax, 3
	lea	rsi, [rax + 4*rax]
	call	_realloc
	mov	qword ptr [r14 + 40], rax
	test	rax, rax
	je	LBB0_27
## %bb.8:
	mov	rax, qword ptr [r14 + 72]
	test	rax, rax
	je	LBB0_13
## %bb.9:
	xor	ebx, ebx
	xor	esi, esi
LBB0_10:                                ## =>This Loop Header: Depth=1
                                        ##     Child Loop BB0_11 Depth 2
                                        ##     Child Loop BB0_31 Depth 2
	mov	rdx, qword ptr [r14 + 32]
	lea	rax, [8*rbx]
	lea	rcx, [rax + 4*rax]
	jmp	LBB0_11
	.p2align	4, 0x90
LBB0_12:                                ##   in Loop: Header=BB0_11 Depth=2
	inc	rbx
	mov	rax, qword ptr [r14 + 72]
	add	rcx, 40
	cmp	rbx, rax
	jae	LBB0_13
LBB0_11:                                ##   Parent Loop BB0_10 Depth=1
                                        ## =>  This Inner Loop Header: Depth=2
	cmp	qword ptr [rdx + rcx + 24], 0
	je	LBB0_12
## %bb.28:                              ##   in Loop: Header=BB0_11 Depth=2
	test	byte ptr [rdx + rcx + 8], 3
	jne	LBB0_12
## %bb.29:                              ##   in Loop: Header=BB0_10 Depth=1
	mov	rax, qword ptr [r14 + 40]
	mov	qword ptr [rbp - 48], rsi ## 8-byte Spill
	lea	rsi, [rsi + 4*rsi]
	mov	rdi, qword ptr [rdx + rcx + 32]
	mov	qword ptr [rax + 8*rsi + 32], rdi
	mov	rdi, qword ptr [rdx + rcx + 24]
	mov	qword ptr [rax + 8*rsi + 24], rdi
	mov	rdi, qword ptr [rdx + rcx + 16]
	mov	qword ptr [rax + 8*rsi + 16], rdi
	mov	rdi, qword ptr [rdx + rcx]
	mov	rdx, qword ptr [rdx + rcx + 8]
	mov	qword ptr [rax + 8*rsi + 8], rdx
	mov	qword ptr [rax + 8*rsi], rdi
	mov	rax, qword ptr [r14 + 32]
	mov	qword ptr [rax + rcx + 8], 0
	mov	qword ptr [rax + rcx + 16], 0
	mov	qword ptr [rax + rcx + 24], 0
	mov	qword ptr [rax + rcx + 32], 0
	mov	qword ptr [rax + rcx], 0
	lea	rax, [rbx + 1]
	xor	edx, edx
	div	qword ptr [r14 + 72]
	mov	r13, qword ptr [r14 + 32]
	lea	rax, [rdx + 4*rdx]
	mov	rax, qword ptr [r13 + 8*rax + 24]
	test	rax, rax
	je	LBB0_33
## %bb.30:                              ##   in Loop: Header=BB0_10 Depth=1
	mov	r12, rbx
	.p2align	4, 0x90
LBB0_31:                                ##   Parent Loop BB0_10 Depth=1
                                        ## =>  This Inner Loop Header: Depth=2
	mov	r15, rdx
	mov	rdi, r14
	mov	rsi, rdx
	mov	rdx, rax
	call	_tgc_probe
	test	rax, rax
	je	LBB0_33
## %bb.32:                              ##   in Loop: Header=BB0_31 Depth=2
	lea	rax, [r12 + 4*r12]
	lea	rcx, [8*r15]
	lea	rcx, [rcx + 4*rcx]
	mov	rdx, qword ptr [r13 + rcx + 32]
	mov	qword ptr [r13 + 8*rax + 32], rdx
	mov	rdx, qword ptr [r13 + rcx + 24]
	mov	qword ptr [r13 + 8*rax + 24], rdx
	mov	rdx, qword ptr [r13 + rcx + 16]
	mov	qword ptr [r13 + 8*rax + 16], rdx
	mov	rdx, qword ptr [r13 + rcx]
	mov	rsi, qword ptr [r13 + rcx + 8]
	mov	qword ptr [r13 + 8*rax + 8], rsi
	mov	qword ptr [r13 + 8*rax], rdx
	mov	rax, qword ptr [r14 + 32]
	mov	qword ptr [rax + rcx + 8], 0
	mov	qword ptr [rax + rcx + 16], 0
	mov	qword ptr [rax + rcx + 24], 0
	mov	qword ptr [rax + rcx + 32], 0
	mov	qword ptr [rax + rcx], 0
	lea	rax, [r15 + 1]
	xor	edx, edx
	div	qword ptr [r14 + 72]
	mov	r13, qword ptr [r14 + 32]
	lea	rax, [rdx + 4*rdx]
	mov	rax, qword ptr [r13 + 8*rax + 24]
	mov	r12, r15
	test	rax, rax
	jne	LBB0_31
LBB0_33:                                ##   in Loop: Header=BB0_10 Depth=1
	dec	qword ptr [r14 + 64]
	mov	rsi, qword ptr [rbp - 48] ## 8-byte Reload
	inc	rsi
	mov	rax, qword ptr [r14 + 72]
	cmp	rbx, rax
	jb	LBB0_10
LBB0_13:
	test	rax, rax
	je	LBB0_19
## %bb.14:
	mov	rcx, qword ptr [r14 + 32]
	add	rcx, 8
	jmp	LBB0_15
	.p2align	4, 0x90
LBB0_18:                                ##   in Loop: Header=BB0_15 Depth=1
	add	rcx, 40
	dec	rax
	je	LBB0_19
LBB0_15:                                ## =>This Inner Loop Header: Depth=1
	cmp	qword ptr [rcx + 16], 0
	je	LBB0_18
## %bb.16:                              ##   in Loop: Header=BB0_15 Depth=1
	mov	edx, dword ptr [rcx]
	test	dl, 1
	je	LBB0_18
## %bb.17:                              ##   in Loop: Header=BB0_15 Depth=1
	and	edx, -2
	mov	dword ptr [rcx], edx
	jmp	LBB0_18
LBB0_19:
	mov	rdi, r14
	call	_tgc_resize_less
	mov	rdi, qword ptr [r14 + 40]
	mov	rax, qword ptr [r14 + 64]
	movq	xmm0, rax
	punpckldq	xmm0, xmmword ptr [rip + LCPI0_0] ## xmm0 = xmm0[0],mem[0],xmm0[1],mem[1]
	subpd	xmm0, xmmword ptr [rip + LCPI0_1]
	movapd	xmm1, xmm0
	unpckhpd	xmm1, xmm0      ## xmm1 = xmm1[1],xmm0[1]
	addsd	xmm1, xmm0
	mulsd	xmm1, qword ptr [r14 + 56]
	movsd	xmm0, qword ptr [rip + LCPI0_2] ## xmm0 = mem[0],zero
	movapd	xmm2, xmm1
	subsd	xmm2, xmm0
	cvttsd2si	rcx, xmm2
	movabs	rdx, -9223372036854775808
	xor	rdx, rcx
	cvttsd2si	rcx, xmm1
	ucomisd	xmm1, xmm0
	cmovae	rcx, rdx
	lea	rax, [rax + rcx + 1]
	mov	qword ptr [r14 + 80], rax
	cmp	qword ptr [r14 + 88], 0
	je	LBB0_26
## %bb.20:
	xor	ebx, ebx
	xor	r15d, r15d
	jmp	LBB0_21
	.p2align	4, 0x90
LBB0_24:                                ##   in Loop: Header=BB0_21 Depth=1
	mov	rax, qword ptr [r14 + 40]
	mov	rdi, qword ptr [rax + rbx]
	call	_free
LBB0_25:                                ##   in Loop: Header=BB0_21 Depth=1
	inc	r15
	mov	rdi, qword ptr [r14 + 40]
	add	rbx, 40
	cmp	r15, qword ptr [r14 + 88]
	jae	LBB0_26
LBB0_21:                                ## =>This Inner Loop Header: Depth=1
	mov	rax, qword ptr [rdi + rbx]
	test	rax, rax
	je	LBB0_25
## %bb.22:                              ##   in Loop: Header=BB0_21 Depth=1
	mov	rcx, qword ptr [rdi + rbx + 32]
	test	rcx, rcx
	je	LBB0_24
## %bb.23:                              ##   in Loop: Header=BB0_21 Depth=1
	mov	rdi, rax
	call	rcx
	jmp	LBB0_24
LBB0_26:
	call	_free
	mov	qword ptr [r14 + 40], 0
	mov	qword ptr [r14 + 88], 0
LBB0_27:
	add	rsp, 8
	pop	rbx
	pop	r12
	pop	r13
	pop	r14
	pop	r15
	pop	rbp
	ret
	.cfi_endproc
                                        ## -- End function
	.p2align	4, 0x90         ## -- Begin function tgc_probe
_tgc_probe:                             ## @tgc_probe
	.cfi_startproc
## %bb.0:
	mov	rax, rsi
	sub	rax, rdx
	inc	rax
	js	LBB1_1
## %bb.2:
	ret
LBB1_1:
	push	rbp
	.cfi_def_cfa_offset 16
	.cfi_offset rbp, -16
	mov	rbp, rsp
	.cfi_def_cfa_register rbp
	add	rax, qword ptr [rdi + 72]
	pop	rbp
	ret
	.cfi_endproc
                                        ## -- End function
	.p2align	4, 0x90         ## -- Begin function tgc_resize_less
_tgc_resize_less:                       ## @tgc_resize_less
	.cfi_startproc
## %bb.0:
	push	rbp
	.cfi_def_cfa_offset 16
	.cfi_offset rbp, -16
	mov	rbp, rsp
	.cfi_def_cfa_register rbp
	push	rbx
	push	rax
	.cfi_offset rbx, -24
	mov	rbx, rdi
	mov	rsi, qword ptr [rdi + 64]
	call	_tgc_ideal_size
	cmp	rax, qword ptr [rbx + 72]
	jae	LBB2_2
## %bb.1:
	mov	rdi, rbx
	mov	rsi, rax
	call	_tgc_rehash
LBB2_2:
	add	rsp, 8
	pop	rbx
	pop	rbp
	ret
	.cfi_endproc
                                        ## -- End function
	.globl	_tgc_start              ## -- Begin function tgc_start
	.p2align	4, 0x90
_tgc_start:                             ## @tgc_start
	.cfi_startproc
## %bb.0:
	push	rbp
	.cfi_def_cfa_offset 16
	.cfi_offset rbp, -16
	mov	rbp, rsp
	.cfi_def_cfa_register rbp
	mov	qword ptr [rdi], rsi
	mov	dword ptr [rdi + 8], 0
	mov	qword ptr [rdi + 24], 0
	mov	qword ptr [rdi + 32], 0
	mov	qword ptr [rdi + 40], 0
	mov	qword ptr [rdi + 64], 0
	mov	qword ptr [rdi + 72], 0
	mov	qword ptr [rdi + 80], 0
	mov	qword ptr [rdi + 88], 0
	mov	qword ptr [rdi + 16], -1
	movabs	rax, 4606281698874543309
	mov	qword ptr [rdi + 48], rax
	movabs	rax, 4602678819172646912
	mov	qword ptr [rdi + 56], rax
	pop	rbp
	ret
	.cfi_endproc
                                        ## -- End function
	.globl	_tgc_stop               ## -- Begin function tgc_stop
	.p2align	4, 0x90
_tgc_stop:                              ## @tgc_stop
	.cfi_startproc
## %bb.0:
	push	rbp
	.cfi_def_cfa_offset 16
	.cfi_offset rbp, -16
	mov	rbp, rsp
	.cfi_def_cfa_register rbp
	push	rbx
	push	rax
	.cfi_offset rbx, -24
	mov	rbx, rdi
	call	_tgc_sweep
	mov	rdi, qword ptr [rbx + 32]
	call	_free
	mov	rdi, qword ptr [rbx + 40]
	call	_free
	add	rsp, 8
	pop	rbx
	pop	rbp
	ret
	.cfi_endproc
                                        ## -- End function
	.globl	_tgc_pause              ## -- Begin function tgc_pause
	.p2align	4, 0x90
_tgc_pause:                             ## @tgc_pause
	.cfi_startproc
## %bb.0:
	push	rbp
	.cfi_def_cfa_offset 16
	.cfi_offset rbp, -16
	mov	rbp, rsp
	.cfi_def_cfa_register rbp
	mov	dword ptr [rdi + 8], 1
	pop	rbp
	ret
	.cfi_endproc
                                        ## -- End function
	.globl	_tgc_resume             ## -- Begin function tgc_resume
	.p2align	4, 0x90
_tgc_resume:                            ## @tgc_resume
	.cfi_startproc
## %bb.0:
	push	rbp
	.cfi_def_cfa_offset 16
	.cfi_offset rbp, -16
	mov	rbp, rsp
	.cfi_def_cfa_register rbp
	mov	dword ptr [rdi + 8], 0
	pop	rbp
	ret
	.cfi_endproc
                                        ## -- End function
	.globl	_tgc_run                ## -- Begin function tgc_run
	.p2align	4, 0x90
_tgc_run:                               ## @tgc_run
	.cfi_startproc
## %bb.0:
	push	rbp
	.cfi_def_cfa_offset 16
	.cfi_offset rbp, -16
	mov	rbp, rsp
	.cfi_def_cfa_register rbp
	push	rbx
	push	rax
	.cfi_offset rbx, -24
	mov	rbx, rdi
	call	_tgc_mark
	mov	rdi, rbx
	call	_tgc_sweep
	add	rsp, 8
	pop	rbx
	pop	rbp
	ret
	.cfi_endproc
                                        ## -- End function
	.p2align	4, 0x90         ## -- Begin function tgc_mark
_tgc_mark:                              ## @tgc_mark
	.cfi_startproc
## %bb.0:
	push	rbp
	.cfi_def_cfa_offset 16
	.cfi_offset rbp, -16
	mov	rbp, rsp
	.cfi_def_cfa_register rbp
	push	r15
	push	r14
	push	r12
	push	rbx
	sub	rsp, 176
	.cfi_offset rbx, -48
	.cfi_offset r12, -40
	.cfi_offset r14, -32
	.cfi_offset r15, -24
	mov	rax, qword ptr [rip + ___stack_chk_guard@GOTPCREL]
	mov	rax, qword ptr [rax]
	mov	qword ptr [rbp - 40], rax
	lea	rax, [rip + _tgc_mark_stack]
	mov	qword ptr [rbp - 200], rax
	cmp	qword ptr [rdi + 64], 0
	je	LBB8_11
## %bb.1:
	mov	r14, rdi
	cmp	qword ptr [rdi + 72], 0
	je	LBB8_10
## %bb.2:
	xor	r15d, r15d
	jmp	LBB8_3
	.p2align	4, 0x90
LBB8_9:                                 ##   in Loop: Header=BB8_3 Depth=1
	inc	r15
	cmp	r15, qword ptr [r14 + 72]
	jae	LBB8_10
LBB8_3:                                 ## =>This Loop Header: Depth=1
                                        ##     Child Loop BB8_8 Depth 2
	mov	rcx, qword ptr [r14 + 32]
	lea	rax, [r15 + 4*r15]
	cmp	qword ptr [rcx + 8*rax + 24], 0
	je	LBB8_9
## %bb.4:                               ##   in Loop: Header=BB8_3 Depth=1
	mov	edx, dword ptr [rcx + 8*rax + 8]
	mov	esi, edx
	and	esi, 3
	cmp	esi, 2
	jne	LBB8_9
## %bb.5:                               ##   in Loop: Header=BB8_3 Depth=1
	lea	rcx, [rcx + 8*rax + 8]
	mov	esi, edx
	or	esi, 1
	mov	dword ptr [rcx], esi
	test	dl, 4
	jne	LBB8_9
## %bb.6:                               ##   in Loop: Header=BB8_3 Depth=1
	mov	rcx, qword ptr [r14 + 32]
	cmp	qword ptr [rcx + 8*rax + 16], 8
	jb	LBB8_9
## %bb.7:                               ##   in Loop: Header=BB8_3 Depth=1
	xor	ebx, ebx
	.p2align	4, 0x90
LBB8_8:                                 ##   Parent Loop BB8_3 Depth=1
                                        ## =>  This Inner Loop Header: Depth=2
	lea	rax, [8*r15]
	lea	r12, [rax + 4*rax]
	mov	rax, qword ptr [rcx + r12]
	mov	rsi, qword ptr [rax + 8*rbx]
	mov	rdi, r14
	call	_tgc_mark_ptr
	inc	rbx
	mov	rcx, qword ptr [r14 + 32]
	mov	rax, qword ptr [rcx + r12 + 16]
	shr	rax, 3
	cmp	rbx, rax
	jb	LBB8_8
	jmp	LBB8_9
LBB8_10:
	xorps	xmm0, xmm0
	movaps	xmmword ptr [rbp - 64], xmm0
	movaps	xmmword ptr [rbp - 80], xmm0
	movaps	xmmword ptr [rbp - 96], xmm0
	movaps	xmmword ptr [rbp - 112], xmm0
	movaps	xmmword ptr [rbp - 128], xmm0
	movaps	xmmword ptr [rbp - 144], xmm0
	movaps	xmmword ptr [rbp - 160], xmm0
	movaps	xmmword ptr [rbp - 176], xmm0
	movaps	xmmword ptr [rbp - 192], xmm0
	mov	dword ptr [rbp - 48], 0
	lea	rdi, [rbp - 192]
	call	_setjmp
	mov	rax, qword ptr [rbp - 200]
	mov	rdi, r14
	call	rax
LBB8_11:
	mov	rax, qword ptr [rip + ___stack_chk_guard@GOTPCREL]
	mov	rax, qword ptr [rax]
	cmp	rax, qword ptr [rbp - 40]
	jne	LBB8_13
## %bb.12:
	add	rsp, 176
	pop	rbx
	pop	r12
	pop	r14
	pop	r15
	pop	rbp
	ret
LBB8_13:
	call	___stack_chk_fail
	.cfi_endproc
                                        ## -- End function
	.globl	_tgc_alloc              ## -- Begin function tgc_alloc
	.p2align	4, 0x90
_tgc_alloc:                             ## @tgc_alloc
	.cfi_startproc
## %bb.0:
	push	rbp
	.cfi_def_cfa_offset 16
	.cfi_offset rbp, -16
	mov	rbp, rsp
	.cfi_def_cfa_register rbp
	xor	edx, edx
	xor	ecx, ecx
	call	_tgc_alloc_opt
	pop	rbp
	ret
	.cfi_endproc
                                        ## -- End function
	.globl	_tgc_alloc_opt          ## -- Begin function tgc_alloc_opt
	.p2align	4, 0x90
_tgc_alloc_opt:                         ## @tgc_alloc_opt
	.cfi_startproc
## %bb.0:
	push	rbp
	.cfi_def_cfa_offset 16
	.cfi_offset rbp, -16
	mov	rbp, rsp
	.cfi_def_cfa_register rbp
	push	r15
	push	r14
	push	r12
	push	rbx
	.cfi_offset rbx, -48
	.cfi_offset r12, -40
	.cfi_offset r14, -32
	.cfi_offset r15, -24
	mov	r14, rcx
	mov	r15d, edx
	mov	rbx, rsi
	mov	r12, rdi
	mov	rdi, rsi
	call	_malloc
	test	rax, rax
	je	LBB10_1
## %bb.2:
	mov	rdi, r12
	mov	rsi, rax
	mov	rdx, rbx
	mov	ecx, r15d
	mov	r8, r14
	call	_tgc_add
	jmp	LBB10_3
LBB10_1:
	xor	eax, eax
LBB10_3:
	pop	rbx
	pop	r12
	pop	r14
	pop	r15
	pop	rbp
	ret
	.cfi_endproc
                                        ## -- End function
	.globl	_tgc_calloc             ## -- Begin function tgc_calloc
	.p2align	4, 0x90
_tgc_calloc:                            ## @tgc_calloc
	.cfi_startproc
## %bb.0:
	push	rbp
	.cfi_def_cfa_offset 16
	.cfi_offset rbp, -16
	mov	rbp, rsp
	.cfi_def_cfa_register rbp
	xor	ecx, ecx
	xor	r8d, r8d
	call	_tgc_calloc_opt
	pop	rbp
	ret
	.cfi_endproc
                                        ## -- End function
	.globl	_tgc_calloc_opt         ## -- Begin function tgc_calloc_opt
	.p2align	4, 0x90
_tgc_calloc_opt:                        ## @tgc_calloc_opt
	.cfi_startproc
## %bb.0:
	push	rbp
	.cfi_def_cfa_offset 16
	.cfi_offset rbp, -16
	mov	rbp, rsp
	.cfi_def_cfa_register rbp
	push	r15
	push	r14
	push	r13
	push	r12
	push	rbx
	push	rax
	.cfi_offset rbx, -56
	.cfi_offset r12, -48
	.cfi_offset r13, -40
	.cfi_offset r14, -32
	.cfi_offset r15, -24
	mov	r14, r8
	mov	r15d, ecx
	mov	rbx, rdx
	mov	r13, rsi
	mov	r12, rdi
	mov	rdi, rsi
	mov	rsi, rdx
	call	_calloc
	test	rax, rax
	je	LBB12_1
## %bb.2:
	imul	rbx, r13
	mov	rdi, r12
	mov	rsi, rax
	mov	rdx, rbx
	mov	ecx, r15d
	mov	r8, r14
	call	_tgc_add
	jmp	LBB12_3
LBB12_1:
	xor	eax, eax
LBB12_3:
	add	rsp, 8
	pop	rbx
	pop	r12
	pop	r13
	pop	r14
	pop	r15
	pop	rbp
	ret
	.cfi_endproc
                                        ## -- End function
	.globl	_tgc_realloc            ## -- Begin function tgc_realloc
	.p2align	4, 0x90
_tgc_realloc:                           ## @tgc_realloc
	.cfi_startproc
## %bb.0:
	push	rbp
	.cfi_def_cfa_offset 16
	.cfi_offset rbp, -16
	mov	rbp, rsp
	.cfi_def_cfa_register rbp
	push	r15
	push	r14
	push	r13
	push	r12
	push	rbx
	push	rax
	.cfi_offset rbx, -56
	.cfi_offset r12, -48
	.cfi_offset r13, -40
	.cfi_offset r14, -32
	.cfi_offset r15, -24
	mov	r14, rdx
	mov	rbx, rsi
	mov	r15, rdi
	mov	rdi, rsi
	mov	rsi, rdx
	call	_realloc
	test	rax, rax
	je	LBB13_1
## %bb.2:
	mov	r12, rax
	test	rbx, rbx
	je	LBB13_3
## %bb.4:
	mov	rdi, r15
	mov	rsi, rbx
	call	_tgc_get_ptr
	mov	rcx, rax
	cmp	r12, rbx
	jne	LBB13_7
## %bb.5:
	test	rcx, rcx
	je	LBB13_7
## %bb.6:
	mov	qword ptr [rcx + 16], r14
	jmp	LBB13_11
LBB13_1:
	mov	rdi, r15
	mov	rsi, rbx
	call	_tgc_rem
	xor	eax, eax
	jmp	LBB13_12
LBB13_3:
	mov	rdi, r15
	mov	rsi, r12
	mov	rdx, r14
	xor	ecx, ecx
	xor	r8d, r8d
	jmp	LBB13_10
LBB13_7:
	xor	eax, eax
	cmp	r12, rbx
	je	LBB13_12
## %bb.8:
	test	rcx, rcx
	je	LBB13_12
## %bb.9:
	mov	r13d, dword ptr [rcx + 8]
	mov	rax, qword ptr [rcx + 32]
	mov	qword ptr [rbp - 48], rax ## 8-byte Spill
	mov	rdi, r15
	mov	rsi, rbx
	call	_tgc_rem
	mov	rdi, r15
	mov	rsi, r12
	mov	rdx, r14
	mov	ecx, r13d
	mov	r8, qword ptr [rbp - 48] ## 8-byte Reload
LBB13_10:
	call	_tgc_add
LBB13_11:
	mov	rax, r12
LBB13_12:
	add	rsp, 8
	pop	rbx
	pop	r12
	pop	r13
	pop	r14
	pop	r15
	pop	rbp
	ret
	.cfi_endproc
                                        ## -- End function
	.p2align	4, 0x90         ## -- Begin function tgc_rem
_tgc_rem:                               ## @tgc_rem
	.cfi_startproc
## %bb.0:
	push	rbp
	.cfi_def_cfa_offset 16
	.cfi_offset rbp, -16
	mov	rbp, rsp
	.cfi_def_cfa_register rbp
	push	rbx
	push	rax
	.cfi_offset rbx, -24
	mov	rbx, rdi
	call	_tgc_rem_ptr
	mov	rdi, rbx
	call	_tgc_resize_less
	mov	rax, qword ptr [rbx + 64]
	mov	rcx, rax
	shr	rcx
	lea	rax, [rax + rcx + 1]
	mov	qword ptr [rbx + 80], rax
	add	rsp, 8
	pop	rbx
	pop	rbp
	ret
	.cfi_endproc
                                        ## -- End function
	.p2align	4, 0x90         ## -- Begin function tgc_add
_tgc_add:                               ## @tgc_add
	.cfi_startproc
## %bb.0:
	push	rbp
	.cfi_def_cfa_offset 16
	.cfi_offset rbp, -16
	mov	rbp, rsp
	.cfi_def_cfa_register rbp
	push	r15
	push	r14
	push	r13
	push	r12
	push	rbx
	push	rax
	.cfi_offset rbx, -56
	.cfi_offset r12, -48
	.cfi_offset r13, -40
	.cfi_offset r14, -32
	.cfi_offset r15, -24
	mov	rbx, rdi
	inc	qword ptr [rdi + 64]
	mov	r15, rdx
	mov	r14, rsi
	lea	rax, [rsi + rdx]
	mov	rdx, qword ptr [rdi + 24]
	cmp	rax, rdx
	cmova	rdx, rax
	mov	r12, r8
	mov	r13d, ecx
	mov	rax, qword ptr [rdi + 16]
	mov	qword ptr [rdi + 24], rdx
	cmp	rax, rsi
	cmova	rax, rsi
	mov	qword ptr [rdi + 16], rax
	call	_tgc_resize_more
	test	eax, eax
	je	LBB15_4
## %bb.1:
	mov	rdi, rbx
	mov	rsi, r14
	mov	rdx, r15
	mov	ecx, r13d
	mov	r8, r12
	call	_tgc_add_ptr
	cmp	dword ptr [rbx + 8], 0
	jne	LBB15_5
## %bb.2:
	mov	rax, qword ptr [rbx + 64]
	cmp	rax, qword ptr [rbx + 80]
	jbe	LBB15_5
## %bb.3:
	mov	rdi, rbx
	call	_tgc_run
	jmp	LBB15_5
LBB15_4:
	dec	qword ptr [rbx + 64]
	mov	rdi, r14
	call	_free
	xor	r14d, r14d
LBB15_5:
	mov	rax, r14
	add	rsp, 8
	pop	rbx
	pop	r12
	pop	r13
	pop	r14
	pop	r15
	pop	rbp
	ret
	.cfi_endproc
                                        ## -- End function
	.p2align	4, 0x90         ## -- Begin function tgc_get_ptr
_tgc_get_ptr:                           ## @tgc_get_ptr
	.cfi_startproc
## %bb.0:
	push	rbp
	.cfi_def_cfa_offset 16
	.cfi_offset rbp, -16
	mov	rbp, rsp
	.cfi_def_cfa_register rbp
	push	r15
	push	r14
	push	r13
	push	r12
	push	rbx
	push	rax
	.cfi_offset rbx, -56
	.cfi_offset r12, -48
	.cfi_offset r13, -40
	.cfi_offset r14, -32
	.cfi_offset r15, -24
	mov	r12, rdi
	mov	qword ptr [rbp - 48], rsi ## 8-byte Spill
	mov	rdi, rsi
	call	_tgc_hash
	mov	r15, qword ptr [r12 + 32]
	mov	r13, qword ptr [r12 + 72]
	xor	edx, edx
	div	r13
	mov	rbx, rdx
	lea	rax, [rdx + 4*rdx]
	mov	rdx, qword ptr [r15 + 8*rax + 24]
	test	rdx, rdx
	je	LBB16_6
## %bb.1:
	mov	r14, -1
	.p2align	4, 0x90
LBB16_2:                                ## =>This Inner Loop Header: Depth=1
	mov	rdi, r12
	mov	rsi, rbx
	call	_tgc_probe
	inc	r14
	cmp	r14, rax
	ja	LBB16_6
## %bb.3:                               ##   in Loop: Header=BB16_2 Depth=1
	lea	rax, [rbx + 4*rbx]
	mov	rcx, qword ptr [rbp - 48] ## 8-byte Reload
	cmp	qword ptr [r15 + 8*rax], rcx
	je	LBB16_4
## %bb.5:                               ##   in Loop: Header=BB16_2 Depth=1
	inc	rbx
	mov	rax, rbx
	xor	edx, edx
	div	r13
	mov	r15, qword ptr [r12 + 32]
	mov	rbx, rdx
	lea	rax, [rdx + 4*rdx]
	mov	rdx, qword ptr [r15 + 8*rax + 24]
	test	rdx, rdx
	jne	LBB16_2
LBB16_6:
	xor	eax, eax
	jmp	LBB16_7
LBB16_4:
	lea	rax, [r15 + 8*rax]
LBB16_7:
	add	rsp, 8
	pop	rbx
	pop	r12
	pop	r13
	pop	r14
	pop	r15
	pop	rbp
	ret
	.cfi_endproc
                                        ## -- End function
	.globl	_tgc_free               ## -- Begin function tgc_free
	.p2align	4, 0x90
_tgc_free:                              ## @tgc_free
	.cfi_startproc
## %bb.0:
	push	rbp
	.cfi_def_cfa_offset 16
	.cfi_offset rbp, -16
	mov	rbp, rsp
	.cfi_def_cfa_register rbp
	push	r14
	push	rbx
	.cfi_offset rbx, -32
	.cfi_offset r14, -24
	mov	rbx, rsi
	mov	r14, rdi
	call	_tgc_get_ptr
	test	rax, rax
	je	LBB17_4
## %bb.1:
	mov	rax, qword ptr [rax + 32]
	test	rax, rax
	je	LBB17_3
## %bb.2:
	mov	rdi, rbx
	call	rax
LBB17_3:
	mov	rdi, rbx
	call	_free
	mov	rdi, r14
	mov	rsi, rbx
	call	_tgc_rem
LBB17_4:
	pop	rbx
	pop	r14
	pop	rbp
	ret
	.cfi_endproc
                                        ## -- End function
	.globl	_tgc_set_dtor           ## -- Begin function tgc_set_dtor
	.p2align	4, 0x90
_tgc_set_dtor:                          ## @tgc_set_dtor
	.cfi_startproc
## %bb.0:
	push	rbp
	.cfi_def_cfa_offset 16
	.cfi_offset rbp, -16
	mov	rbp, rsp
	.cfi_def_cfa_register rbp
	push	rbx
	push	rax
	.cfi_offset rbx, -24
	mov	rbx, rdx
	call	_tgc_get_ptr
	test	rax, rax
	je	LBB18_2
## %bb.1:
	mov	qword ptr [rax + 32], rbx
LBB18_2:
	add	rsp, 8
	pop	rbx
	pop	rbp
	ret
	.cfi_endproc
                                        ## -- End function
	.globl	_tgc_set_flags          ## -- Begin function tgc_set_flags
	.p2align	4, 0x90
_tgc_set_flags:                         ## @tgc_set_flags
	.cfi_startproc
## %bb.0:
	push	rbp
	.cfi_def_cfa_offset 16
	.cfi_offset rbp, -16
	mov	rbp, rsp
	.cfi_def_cfa_register rbp
	push	rbx
	push	rax
	.cfi_offset rbx, -24
	mov	ebx, edx
	call	_tgc_get_ptr
	test	rax, rax
	je	LBB19_2
## %bb.1:
	mov	dword ptr [rax + 8], ebx
LBB19_2:
	add	rsp, 8
	pop	rbx
	pop	rbp
	ret
	.cfi_endproc
                                        ## -- End function
	.globl	_tgc_get_flags          ## -- Begin function tgc_get_flags
	.p2align	4, 0x90
_tgc_get_flags:                         ## @tgc_get_flags
	.cfi_startproc
## %bb.0:
	push	rbp
	.cfi_def_cfa_offset 16
	.cfi_offset rbp, -16
	mov	rbp, rsp
	.cfi_def_cfa_register rbp
	call	_tgc_get_ptr
	test	rax, rax
	je	LBB20_1
## %bb.2:
	mov	eax, dword ptr [rax + 8]
	pop	rbp
	ret
LBB20_1:
	xor	eax, eax
	pop	rbp
	ret
	.cfi_endproc
                                        ## -- End function
	.globl	_tgc_get_dtor           ## -- Begin function tgc_get_dtor
	.p2align	4, 0x90
_tgc_get_dtor:                          ## @tgc_get_dtor
	.cfi_startproc
## %bb.0:
	push	rbp
	.cfi_def_cfa_offset 16
	.cfi_offset rbp, -16
	mov	rbp, rsp
	.cfi_def_cfa_register rbp
	call	_tgc_get_ptr
	test	rax, rax
	je	LBB21_1
## %bb.2:
	mov	rax, qword ptr [rax + 32]
	pop	rbp
	ret
LBB21_1:
	xor	eax, eax
	pop	rbp
	ret
	.cfi_endproc
                                        ## -- End function
	.globl	_tgc_get_size           ## -- Begin function tgc_get_size
	.p2align	4, 0x90
_tgc_get_size:                          ## @tgc_get_size
	.cfi_startproc
## %bb.0:
	push	rbp
	.cfi_def_cfa_offset 16
	.cfi_offset rbp, -16
	mov	rbp, rsp
	.cfi_def_cfa_register rbp
	call	_tgc_get_ptr
	test	rax, rax
	je	LBB22_1
## %bb.2:
	mov	rax, qword ptr [rax + 16]
	pop	rbp
	ret
LBB22_1:
	xor	eax, eax
	pop	rbp
	ret
	.cfi_endproc
                                        ## -- End function
	.globl	_begin_gc               ## -- Begin function begin_gc
	.p2align	4, 0x90
_begin_gc:                              ## @begin_gc
	.cfi_startproc
## %bb.0:
	push	rbp
	.cfi_def_cfa_offset 16
	.cfi_offset rbp, -16
	mov	rbp, rsp
	.cfi_def_cfa_register rbp
	sub	rsp, 16
	mov	dword ptr [rbp - 4], 0
	lea	rdi, [rip + _gc]
	lea	rsi, [rbp - 4]
	call	_tgc_start
	add	rsp, 16
	pop	rbp
	ret
	.cfi_endproc
                                        ## -- End function
	.globl	_allocate               ## -- Begin function allocate
	.p2align	4, 0x90
_allocate:                              ## @allocate
	.cfi_startproc
## %bb.0:
	push	rbp
	.cfi_def_cfa_offset 16
	.cfi_offset rbp, -16
	mov	rbp, rsp
	.cfi_def_cfa_register rbp
	mov	rsi, rdi
	lea	rdi, [rip + _gc]
	call	_tgc_alloc
	pop	rbp
	ret
	.cfi_endproc
                                        ## -- End function
	.globl	_end_gc                 ## -- Begin function end_gc
	.p2align	4, 0x90
_end_gc:                                ## @end_gc
	.cfi_startproc
## %bb.0:
	push	rbp
	.cfi_def_cfa_offset 16
	.cfi_offset rbp, -16
	mov	rbp, rsp
	.cfi_def_cfa_register rbp
	lea	rdi, [rip + _gc]
	call	_tgc_stop
	pop	rbp
	ret
	.cfi_endproc
                                        ## -- End function
	.globl	_calculation            ## -- Begin function calculation
	.p2align	4, 0x90
_calculation:                           ## @calculation
	.cfi_startproc
## %bb.0:
	push	rbp
	.cfi_def_cfa_offset 16
	.cfi_offset rbp, -16
	mov	rbp, rsp
	.cfi_def_cfa_register rbp
                                        ## kill: def $edi killed $edi def $rdi
	lea	eax, [rdi + 2*rdi - 556]
	pop	rbp
	ret
	.cfi_endproc
                                        ## -- End function
	.section	__TEXT,__literal16,16byte_literals
	.p2align	4               ## -- Begin function tgc_ideal_size
LCPI27_0:
	.long	1127219200              ## 0x43300000
	.long	1160773632              ## 0x45300000
	.long	0                       ## 0x0
	.long	0                       ## 0x0
LCPI27_1:
	.quad	4841369599423283200     ## double 4503599627370496
	.quad	4985484787499139072     ## double 1.9342813113834067E+25
	.section	__TEXT,__literal8,8byte_literals
	.p2align	3
LCPI27_2:
	.quad	4890909195324358656     ## double 9.2233720368547758E+18
	.section	__TEXT,__text,regular,pure_instructions
	.p2align	4, 0x90
_tgc_ideal_size:                        ## @tgc_ideal_size
	.cfi_startproc
## %bb.0:
	push	rbp
	.cfi_def_cfa_offset 16
	.cfi_offset rbp, -16
	mov	rbp, rsp
	.cfi_def_cfa_register rbp
	inc	rsi
	movq	xmm0, rsi
	punpckldq	xmm0, xmmword ptr [rip + LCPI27_0] ## xmm0 = xmm0[0],mem[0],xmm0[1],mem[1]
	subpd	xmm0, xmmword ptr [rip + LCPI27_1]
	movapd	xmm1, xmm0
	unpckhpd	xmm1, xmm0      ## xmm1 = xmm1[1],xmm0[1]
	addsd	xmm1, xmm0
	divsd	xmm1, qword ptr [rdi + 48]
	movsd	xmm0, qword ptr [rip + LCPI27_2] ## xmm0 = mem[0],zero
	movapd	xmm2, xmm1
	subsd	xmm2, xmm0
	cvttsd2si	rax, xmm2
	movabs	rdx, -9223372036854775808
	xor	rdx, rax
	cvttsd2si	rcx, xmm1
	ucomisd	xmm1, xmm0
	cmovae	rcx, rdx
	xor	edx, edx
	lea	rsi, [rip + _tgc_primes]
	.p2align	4, 0x90
LBB27_1:                                ## =>This Inner Loop Header: Depth=1
	mov	rax, qword ptr [rdx + rsi]
	cmp	rax, rcx
	jae	LBB27_5
## %bb.2:                               ##   in Loop: Header=BB27_1 Depth=1
	add	rdx, 8
	cmp	rdx, 192
	jne	LBB27_1
## %bb.3:
	mov	rax, -8800019
	.p2align	4, 0x90
LBB27_4:                                ## =>This Inner Loop Header: Depth=1
	add	rax, 8800019
	cmp	rax, rcx
	jb	LBB27_4
LBB27_5:
	pop	rbp
	ret
	.cfi_endproc
                                        ## -- End function
	.p2align	4, 0x90         ## -- Begin function tgc_rehash
_tgc_rehash:                            ## @tgc_rehash
	.cfi_startproc
## %bb.0:
	push	rbp
	.cfi_def_cfa_offset 16
	.cfi_offset rbp, -16
	mov	rbp, rsp
	.cfi_def_cfa_register rbp
	push	r15
	push	r14
	push	r12
	push	rbx
	.cfi_offset rbx, -48
	.cfi_offset r12, -40
	.cfi_offset r14, -32
	.cfi_offset r15, -24
	mov	rax, rsi
	mov	r15, rdi
	mov	r14, qword ptr [rdi + 32]
	mov	r12, qword ptr [rdi + 72]
	mov	qword ptr [rdi + 72], rsi
	mov	esi, 40
	mov	rdi, rax
	call	_calloc
	mov	qword ptr [r15 + 32], rax
	test	rax, rax
	je	LBB28_8
## %bb.1:
	test	r12, r12
	je	LBB28_6
## %bb.2:
	lea	rbx, [r14 + 32]
	jmp	LBB28_3
	.p2align	4, 0x90
LBB28_5:                                ##   in Loop: Header=BB28_3 Depth=1
	add	rbx, 40
	dec	r12
	je	LBB28_6
LBB28_3:                                ## =>This Inner Loop Header: Depth=1
	cmp	qword ptr [rbx - 8], 0
	je	LBB28_5
## %bb.4:                               ##   in Loop: Header=BB28_3 Depth=1
	mov	rsi, qword ptr [rbx - 32]
	mov	rdx, qword ptr [rbx - 16]
	mov	ecx, dword ptr [rbx - 24]
	mov	r8, qword ptr [rbx]
	mov	rdi, r15
	call	_tgc_add_ptr
	jmp	LBB28_5
LBB28_6:
	mov	rdi, r14
	call	_free
	mov	eax, 1
	jmp	LBB28_7
LBB28_8:
	mov	qword ptr [r15 + 72], r12
	mov	qword ptr [r15 + 32], r14
	xor	eax, eax
LBB28_7:
	pop	rbx
	pop	r12
	pop	r14
	pop	r15
	pop	rbp
	ret
	.cfi_endproc
                                        ## -- End function
	.p2align	4, 0x90         ## -- Begin function tgc_add_ptr
_tgc_add_ptr:                           ## @tgc_add_ptr
	.cfi_startproc
## %bb.0:
	push	rbp
	.cfi_def_cfa_offset 16
	.cfi_offset rbp, -16
	mov	rbp, rsp
	.cfi_def_cfa_register rbp
	push	r15
	push	r14
	push	r13
	push	r12
	push	rbx
	sub	rsp, 72
	.cfi_offset rbx, -56
	.cfi_offset r12, -48
	.cfi_offset r13, -40
	.cfi_offset r14, -32
	.cfi_offset r15, -24
	mov	qword ptr [rbp - 72], r8 ## 8-byte Spill
	mov	dword ptr [rbp - 44], ecx ## 4-byte Spill
	mov	qword ptr [rbp - 64], rdx ## 8-byte Spill
	mov	r14, rsi
	mov	rbx, rdi
	mov	rdi, rsi
	call	_tgc_hash
	mov	rdi, rbx
	xor	edx, edx
	div	qword ptr [rbx + 72]
	mov	rbx, rdx
	mov	r12, qword ptr [rdi + 32]
	lea	rax, [rdx + 4*rdx]
	lea	rcx, [rdx + 1]
	mov	qword ptr [rbp - 56], rcx ## 8-byte Spill
	lea	rsi, [r12 + 8*rax]
	lea	rdx, [r12 + 8*rax + 24]
	mov	r15, qword ptr [r12 + 8*rax + 24]
	test	r15, r15
	je	LBB29_1
## %bb.4:
	xor	r13d, r13d
                                        ## implicit-def: $eax
                                        ## kill: killed $eax
	mov	qword ptr [rbp - 80], rdi ## 8-byte Spill
	jmp	LBB29_5
	.p2align	4, 0x90
LBB29_8:                                ##   in Loop: Header=BB29_5 Depth=1
	lea	rcx, [rbx + 4*rbx]
	mov	r9d, dword ptr [r12 + 8*rcx + 8]
	mov	rsi, qword ptr [rbp - 88] ## 8-byte Reload
	mov	r10d, dword ptr [rsi + 12]
	mov	rdi, qword ptr [r12 + 8*rcx + 16]
	mov	r8, qword ptr [r12 + 8*rcx + 32]
	mov	qword ptr [rsi], r14
	mov	edx, dword ptr [rbp - 44] ## 4-byte Reload
	mov	dword ptr [r12 + 8*rcx + 8], edx
	mov	edx, dword ptr [rbp - 48] ## 4-byte Reload
	mov	dword ptr [rsi + 12], edx
	mov	rdx, qword ptr [rbp - 64] ## 8-byte Reload
	mov	qword ptr [r12 + 8*rcx + 16], rdx
	mov	rdx, qword ptr [rbp - 56] ## 8-byte Reload
	mov	rsi, qword ptr [rbp - 96] ## 8-byte Reload
	mov	qword ptr [rsi], rdx
	mov	rdx, qword ptr [rbp - 72] ## 8-byte Reload
	mov	qword ptr [r12 + 8*rcx + 32], rdx
	mov	qword ptr [rbp - 64], rdi ## 8-byte Spill
	mov	dword ptr [rbp - 48], r10d ## 4-byte Spill
	mov	dword ptr [rbp - 44], r9d ## 4-byte Spill
	mov	qword ptr [rbp - 72], r8 ## 8-byte Spill
	mov	r13, rax
	mov	rcx, qword ptr [rbp - 104] ## 8-byte Reload
	mov	r14, rcx
	mov	qword ptr [rbp - 56], r15 ## 8-byte Spill
LBB29_9:                                ##   in Loop: Header=BB29_5 Depth=1
	mov	rdi, qword ptr [rbp - 80] ## 8-byte Reload
	inc	rbx
	mov	rax, rbx
	xor	edx, edx
	div	qword ptr [rdi + 72]
	inc	r13
	mov	r12, qword ptr [rdi + 32]
	mov	rbx, rdx
	lea	rax, [rdx + 4*rdx]
	lea	rsi, [r12 + 8*rax]
	lea	rdx, [r12 + 8*rax + 24]
	mov	r15, qword ptr [r12 + 8*rax + 24]
	test	r15, r15
	je	LBB29_2
LBB29_5:                                ## =>This Inner Loop Header: Depth=1
	mov	rax, qword ptr [rsi]
	cmp	rax, r14
	je	LBB29_3
## %bb.6:                               ##   in Loop: Header=BB29_5 Depth=1
	mov	qword ptr [rbp - 88], rsi ## 8-byte Spill
	mov	qword ptr [rbp - 96], rdx ## 8-byte Spill
	mov	qword ptr [rbp - 104], rax ## 8-byte Spill
	mov	rsi, rbx
	mov	rdx, r15
	call	_tgc_probe
	cmp	r13, rax
	jae	LBB29_8
## %bb.7:                               ##   in Loop: Header=BB29_5 Depth=1
	mov	rcx, r14
	jmp	LBB29_9
LBB29_1:
                                        ## implicit-def: $eax
                                        ## kill: killed $eax
	mov	rcx, r14
LBB29_2:
	mov	qword ptr [rsi], rcx
	lea	rax, [rbx + 4*rbx]
	mov	ecx, dword ptr [rbp - 44] ## 4-byte Reload
	mov	dword ptr [r12 + 8*rax + 8], ecx
	mov	ecx, dword ptr [rbp - 48] ## 4-byte Reload
	mov	dword ptr [rsi + 12], ecx
	mov	rcx, qword ptr [rbp - 64] ## 8-byte Reload
	mov	qword ptr [r12 + 8*rax + 16], rcx
	mov	rcx, qword ptr [rbp - 56] ## 8-byte Reload
	mov	qword ptr [rdx], rcx
	mov	rcx, qword ptr [rbp - 72] ## 8-byte Reload
	mov	qword ptr [r12 + 8*rax + 32], rcx
LBB29_3:
	add	rsp, 72
	pop	rbx
	pop	r12
	pop	r13
	pop	r14
	pop	r15
	pop	rbp
	ret
	.cfi_endproc
                                        ## -- End function
	.p2align	4, 0x90         ## -- Begin function tgc_hash
_tgc_hash:                              ## @tgc_hash
	.cfi_startproc
## %bb.0:
	push	rbp
	.cfi_def_cfa_offset 16
	.cfi_offset rbp, -16
	mov	rbp, rsp
	.cfi_def_cfa_register rbp
	mov	rax, rdi
	shr	rax, 3
	pop	rbp
	ret
	.cfi_endproc
                                        ## -- End function
	.p2align	4, 0x90         ## -- Begin function tgc_mark_stack
_tgc_mark_stack:                        ## @tgc_mark_stack
	.cfi_startproc
## %bb.0:
	push	rbp
	.cfi_def_cfa_offset 16
	.cfi_offset rbp, -16
	mov	rbp, rsp
	.cfi_def_cfa_register rbp
	push	r15
	push	r14
	push	r12
	push	rbx
	sub	rsp, 16
	.cfi_offset rbx, -48
	.cfi_offset r12, -40
	.cfi_offset r14, -32
	.cfi_offset r15, -24
	mov	r15, qword ptr [rdi]
	lea	r12, [rbp - 40]
	cmp	r15, r12
	je	LBB31_6
## %bb.1:
	mov	r14, rdi
	jae	LBB31_4
## %bb.2:
	lea	rbx, [rbp - 40]
	.p2align	4, 0x90
LBB31_3:                                ## =>This Inner Loop Header: Depth=1
	mov	rsi, qword ptr [rbx]
	mov	rdi, r14
	call	_tgc_mark_ptr
	add	rbx, -8
	cmp	rbx, r15
	jae	LBB31_3
LBB31_4:
	cmp	r15, r12
	jbe	LBB31_6
	.p2align	4, 0x90
LBB31_5:                                ## =>This Inner Loop Header: Depth=1
	mov	rsi, qword ptr [r12]
	mov	rdi, r14
	call	_tgc_mark_ptr
	add	r12, 8
	cmp	r12, r15
	jbe	LBB31_5
LBB31_6:
	add	rsp, 16
	pop	rbx
	pop	r12
	pop	r14
	pop	r15
	pop	rbp
	ret
	.cfi_endproc
                                        ## -- End function
	.p2align	4, 0x90         ## -- Begin function tgc_mark_ptr
_tgc_mark_ptr:                          ## @tgc_mark_ptr
	.cfi_startproc
## %bb.0:
	push	rbp
	.cfi_def_cfa_offset 16
	.cfi_offset rbp, -16
	mov	rbp, rsp
	.cfi_def_cfa_register rbp
	push	r15
	push	r14
	push	r13
	push	r12
	push	rbx
	push	rax
	.cfi_offset rbx, -56
	.cfi_offset r12, -48
	.cfi_offset r13, -40
	.cfi_offset r14, -32
	.cfi_offset r15, -24
	cmp	qword ptr [rdi + 16], rsi
	ja	LBB32_12
## %bb.1:
	mov	r14, rsi
	mov	r15, rdi
	cmp	qword ptr [rdi + 24], rsi
	jb	LBB32_12
## %bb.2:
	mov	rdi, r14
	call	_tgc_hash
	mov	r13, qword ptr [r15 + 32]
	mov	rcx, qword ptr [r15 + 72]
	xor	edx, edx
	mov	qword ptr [rbp - 48], rcx ## 8-byte Spill
	div	rcx
	mov	rbx, rdx
	lea	rax, [rdx + 4*rdx]
	mov	rdx, qword ptr [r13 + 8*rax + 24]
	test	rdx, rdx
	je	LBB32_12
## %bb.3:
	mov	r12, -1
	.p2align	4, 0x90
LBB32_4:                                ## =>This Inner Loop Header: Depth=1
	mov	rdi, r15
	mov	rsi, rbx
	call	_tgc_probe
	inc	r12
	cmp	r12, rax
	ja	LBB32_12
## %bb.5:                               ##   in Loop: Header=BB32_4 Depth=1
	lea	rcx, [rbx + 4*rbx]
	cmp	qword ptr [r13 + 8*rcx], r14
	je	LBB32_6
## %bb.11:                              ##   in Loop: Header=BB32_4 Depth=1
	inc	rbx
	mov	rax, rbx
	xor	edx, edx
	div	qword ptr [rbp - 48]    ## 8-byte Folded Reload
	mov	r13, qword ptr [r15 + 32]
	mov	rbx, rdx
	lea	rax, [rdx + 4*rdx]
	mov	rdx, qword ptr [r13 + 8*rax + 24]
	test	rdx, rdx
	jne	LBB32_4
	jmp	LBB32_12
LBB32_6:
	mov	eax, dword ptr [r13 + 8*rcx + 8]
	test	al, 1
	jne	LBB32_12
## %bb.7:
	lea	rdx, [r13 + 8*rcx + 8]
	mov	esi, eax
	or	esi, 1
	mov	dword ptr [rdx], esi
	test	al, 4
	jne	LBB32_12
## %bb.8:
	mov	rax, qword ptr [r15 + 32]
	cmp	qword ptr [rax + 8*rcx + 16], 8
	jb	LBB32_12
## %bb.9:
	xor	r14d, r14d
	shl	rbx, 3
	lea	rbx, [rbx + 4*rbx]
	.p2align	4, 0x90
LBB32_10:                               ## =>This Inner Loop Header: Depth=1
	mov	rax, qword ptr [rax + rbx]
	mov	rsi, qword ptr [rax + 8*r14]
	mov	rdi, r15
	call	_tgc_mark_ptr
	inc	r14
	mov	rax, qword ptr [r15 + 32]
	mov	rcx, qword ptr [rax + rbx + 16]
	shr	rcx, 3
	cmp	r14, rcx
	jb	LBB32_10
LBB32_12:
	add	rsp, 8
	pop	rbx
	pop	r12
	pop	r13
	pop	r14
	pop	r15
	pop	rbp
	ret
	.cfi_endproc
                                        ## -- End function
	.p2align	4, 0x90         ## -- Begin function tgc_rem_ptr
_tgc_rem_ptr:                           ## @tgc_rem_ptr
	.cfi_startproc
## %bb.0:
	push	rbp
	.cfi_def_cfa_offset 16
	.cfi_offset rbp, -16
	mov	rbp, rsp
	.cfi_def_cfa_register rbp
	push	r15
	push	r14
	push	r13
	push	r12
	push	rbx
	push	rax
	.cfi_offset rbx, -56
	.cfi_offset r12, -48
	.cfi_offset r13, -40
	.cfi_offset r14, -32
	.cfi_offset r15, -24
	cmp	qword ptr [rdi + 64], 0
	je	LBB33_16
## %bb.1:
	mov	r15, rsi
	mov	r14, rdi
	mov	rax, qword ptr [rdi + 88]
	test	rax, rax
	je	LBB33_6
## %bb.2:
	mov	rcx, qword ptr [r14 + 40]
	xor	edx, edx
	jmp	LBB33_3
	.p2align	4, 0x90
LBB33_5:                                ##   in Loop: Header=BB33_3 Depth=1
	inc	rdx
	add	rcx, 40
	cmp	rdx, rax
	jae	LBB33_6
LBB33_3:                                ## =>This Inner Loop Header: Depth=1
	cmp	qword ptr [rcx], r15
	jne	LBB33_5
## %bb.4:                               ##   in Loop: Header=BB33_3 Depth=1
	mov	qword ptr [rcx], 0
	jmp	LBB33_5
LBB33_6:
	mov	rdi, r15
	call	_tgc_hash
	mov	r13, qword ptr [r14 + 32]
	mov	rcx, qword ptr [r14 + 72]
	xor	edx, edx
	mov	qword ptr [rbp - 48], rcx ## 8-byte Spill
	div	rcx
	mov	rbx, rdx
	lea	rax, [rdx + 4*rdx]
	mov	rdx, qword ptr [r13 + 8*rax + 24]
	test	rdx, rdx
	je	LBB33_16
## %bb.7:
	mov	r12, -1
	.p2align	4, 0x90
LBB33_8:                                ## =>This Inner Loop Header: Depth=1
	mov	rdi, r14
	mov	rsi, rbx
	call	_tgc_probe
	inc	r12
	cmp	r12, rax
	ja	LBB33_16
## %bb.9:                               ##   in Loop: Header=BB33_8 Depth=1
	lea	rax, [rbx + 4*rbx]
	cmp	qword ptr [r13 + 8*rax], r15
	je	LBB33_10
## %bb.15:                              ##   in Loop: Header=BB33_8 Depth=1
	inc	rbx
	mov	rax, rbx
	xor	edx, edx
	div	qword ptr [rbp - 48]    ## 8-byte Folded Reload
	mov	r13, qword ptr [r14 + 32]
	mov	rbx, rdx
	lea	rax, [rdx + 4*rdx]
	mov	rdx, qword ptr [r13 + 8*rax + 24]
	test	rdx, rdx
	jne	LBB33_8
	jmp	LBB33_16
LBB33_10:
	lea	rax, [r13 + 8*rax]
	mov	qword ptr [rax + 32], 0
	mov	qword ptr [rax + 24], 0
	mov	qword ptr [rax + 16], 0
	mov	qword ptr [rax + 8], 0
	mov	qword ptr [rax], 0
	lea	rax, [rbx + 1]
	xor	edx, edx
	div	qword ptr [r14 + 72]
	mov	r12, qword ptr [r14 + 32]
	lea	rax, [rdx + 4*rdx]
	mov	rax, qword ptr [r12 + 8*rax + 24]
	test	rax, rax
	je	LBB33_14
	.p2align	4, 0x90
LBB33_12:                               ## =>This Inner Loop Header: Depth=1
	mov	r15, rdx
	mov	rdi, r14
	mov	rsi, rdx
	mov	rdx, rax
	call	_tgc_probe
	test	rax, rax
	je	LBB33_14
## %bb.13:                              ##   in Loop: Header=BB33_12 Depth=1
	lea	rax, [rbx + 4*rbx]
	lea	rcx, [8*r15]
	lea	rcx, [rcx + 4*rcx]
	mov	rdx, qword ptr [r12 + rcx + 32]
	mov	qword ptr [r12 + 8*rax + 32], rdx
	mov	rdx, qword ptr [r12 + rcx + 24]
	mov	qword ptr [r12 + 8*rax + 24], rdx
	mov	rdx, qword ptr [r12 + rcx + 16]
	mov	qword ptr [r12 + 8*rax + 16], rdx
	mov	rdx, qword ptr [r12 + rcx]
	mov	rsi, qword ptr [r12 + rcx + 8]
	mov	qword ptr [r12 + 8*rax + 8], rsi
	mov	qword ptr [r12 + 8*rax], rdx
	mov	rax, qword ptr [r14 + 32]
	mov	qword ptr [rax + rcx + 8], 0
	mov	qword ptr [rax + rcx + 16], 0
	mov	qword ptr [rax + rcx + 24], 0
	mov	qword ptr [rax + rcx + 32], 0
	mov	qword ptr [rax + rcx], 0
	lea	rax, [r15 + 1]
	xor	edx, edx
	div	qword ptr [r14 + 72]
	mov	r12, qword ptr [r14 + 32]
	lea	rax, [rdx + 4*rdx]
	mov	rax, qword ptr [r12 + 8*rax + 24]
	mov	rbx, r15
	test	rax, rax
	jne	LBB33_12
LBB33_14:
	dec	qword ptr [r14 + 64]
LBB33_16:
	add	rsp, 8
	pop	rbx
	pop	r12
	pop	r13
	pop	r14
	pop	r15
	pop	rbp
	ret
	.cfi_endproc
                                        ## -- End function
	.p2align	4, 0x90         ## -- Begin function tgc_resize_more
_tgc_resize_more:                       ## @tgc_resize_more
	.cfi_startproc
## %bb.0:
	push	rbp
	.cfi_def_cfa_offset 16
	.cfi_offset rbp, -16
	mov	rbp, rsp
	.cfi_def_cfa_register rbp
	push	rbx
	push	rax
	.cfi_offset rbx, -24
	mov	rbx, rdi
	mov	rsi, qword ptr [rdi + 64]
	call	_tgc_ideal_size
	mov	ecx, 1
	cmp	rax, qword ptr [rbx + 72]
	jbe	LBB34_2
## %bb.1:
	mov	rdi, rbx
	mov	rsi, rax
	call	_tgc_rehash
	mov	ecx, eax
LBB34_2:
	mov	eax, ecx
	add	rsp, 8
	pop	rbx
	pop	rbp
	ret
	.cfi_endproc
                                        ## -- End function
.zerofill __DATA,__bss,_gc,96,3         ## @gc
	.section	__TEXT,__const
	.p2align	4               ## @tgc_primes
_tgc_primes:
	.quad	0                       ## 0x0
	.quad	1                       ## 0x1
	.quad	5                       ## 0x5
	.quad	11                      ## 0xb
	.quad	23                      ## 0x17
	.quad	53                      ## 0x35
	.quad	101                     ## 0x65
	.quad	197                     ## 0xc5
	.quad	389                     ## 0x185
	.quad	683                     ## 0x2ab
	.quad	1259                    ## 0x4eb
	.quad	2417                    ## 0x971
	.quad	4733                    ## 0x127d
	.quad	9371                    ## 0x249b
	.quad	18617                   ## 0x48b9
	.quad	37097                   ## 0x90e9
	.quad	74093                   ## 0x1216d
	.quad	148073                  ## 0x24269
	.quad	296099                  ## 0x484a3
	.quad	592019                  ## 0x90893
	.quad	1100009                 ## 0x10c8e9
	.quad	2200013                 ## 0x2191cd
	.quad	4400021                 ## 0x432395
	.quad	8800019                 ## 0x864713

.subsections_via_symbols
