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
	sub	rsp, 80
	mov	qword ptr [rbp - 8], rdi
	mov	rax, qword ptr [rbp - 8]
	cmp	qword ptr [rax + 64], 0
	jne	LBB0_2
## %bb.1:
	jmp	LBB0_46
LBB0_2:
	mov	rax, qword ptr [rbp - 8]
	mov	qword ptr [rax + 88], 0
	mov	qword ptr [rbp - 16], 0
LBB0_3:                                 ## =>This Inner Loop Header: Depth=1
	mov	rax, qword ptr [rbp - 16]
	mov	rcx, qword ptr [rbp - 8]
	cmp	rax, qword ptr [rcx + 72]
	jae	LBB0_12
## %bb.4:                               ##   in Loop: Header=BB0_3 Depth=1
	mov	rax, qword ptr [rbp - 8]
	mov	rax, qword ptr [rax + 32]
	imul	rcx, qword ptr [rbp - 16], 40
	add	rax, rcx
	cmp	qword ptr [rax + 24], 0
	jne	LBB0_6
## %bb.5:                               ##   in Loop: Header=BB0_3 Depth=1
	jmp	LBB0_11
LBB0_6:                                 ##   in Loop: Header=BB0_3 Depth=1
	mov	rax, qword ptr [rbp - 8]
	mov	rax, qword ptr [rax + 32]
	imul	rcx, qword ptr [rbp - 16], 40
	add	rax, rcx
	mov	edx, dword ptr [rax + 8]
	and	edx, 1
	cmp	edx, 0
	je	LBB0_8
## %bb.7:                               ##   in Loop: Header=BB0_3 Depth=1
	jmp	LBB0_11
LBB0_8:                                 ##   in Loop: Header=BB0_3 Depth=1
	mov	rax, qword ptr [rbp - 8]
	mov	rax, qword ptr [rax + 32]
	imul	rcx, qword ptr [rbp - 16], 40
	add	rax, rcx
	mov	edx, dword ptr [rax + 8]
	and	edx, 2
	cmp	edx, 0
	je	LBB0_10
## %bb.9:                               ##   in Loop: Header=BB0_3 Depth=1
	jmp	LBB0_11
LBB0_10:                                ##   in Loop: Header=BB0_3 Depth=1
	mov	rax, qword ptr [rbp - 8]
	mov	rcx, qword ptr [rax + 88]
	add	rcx, 1
	mov	qword ptr [rax + 88], rcx
LBB0_11:                                ##   in Loop: Header=BB0_3 Depth=1
	mov	rax, qword ptr [rbp - 16]
	add	rax, 1
	mov	qword ptr [rbp - 16], rax
	jmp	LBB0_3
LBB0_12:
	mov	rax, qword ptr [rbp - 8]
	mov	rax, qword ptr [rax + 40]
	mov	rcx, qword ptr [rbp - 8]
	imul	rsi, qword ptr [rcx + 88], 40
	mov	rdi, rax
	call	_realloc
	mov	rcx, qword ptr [rbp - 8]
	mov	qword ptr [rcx + 40], rax
	mov	rax, qword ptr [rbp - 8]
	cmp	qword ptr [rax + 40], 0
	jne	LBB0_14
## %bb.13:
	jmp	LBB0_46
LBB0_14:
	mov	qword ptr [rbp - 16], 0
	mov	qword ptr [rbp - 32], 0
LBB0_15:                                ## =>This Loop Header: Depth=1
                                        ##     Child Loop BB0_23 Depth 2
	mov	rax, qword ptr [rbp - 16]
	mov	rcx, qword ptr [rbp - 8]
	cmp	rax, qword ptr [rcx + 72]
	jae	LBB0_29
## %bb.16:                              ##   in Loop: Header=BB0_15 Depth=1
	mov	rax, qword ptr [rbp - 8]
	mov	rax, qword ptr [rax + 32]
	imul	rcx, qword ptr [rbp - 16], 40
	add	rax, rcx
	cmp	qword ptr [rax + 24], 0
	jne	LBB0_18
## %bb.17:                              ##   in Loop: Header=BB0_15 Depth=1
	mov	rax, qword ptr [rbp - 16]
	add	rax, 1
	mov	qword ptr [rbp - 16], rax
	jmp	LBB0_15
LBB0_18:                                ##   in Loop: Header=BB0_15 Depth=1
	mov	rax, qword ptr [rbp - 8]
	mov	rax, qword ptr [rax + 32]
	imul	rcx, qword ptr [rbp - 16], 40
	add	rax, rcx
	mov	edx, dword ptr [rax + 8]
	and	edx, 1
	cmp	edx, 0
	je	LBB0_20
## %bb.19:                              ##   in Loop: Header=BB0_15 Depth=1
	mov	rax, qword ptr [rbp - 16]
	add	rax, 1
	mov	qword ptr [rbp - 16], rax
	jmp	LBB0_15
LBB0_20:                                ##   in Loop: Header=BB0_15 Depth=1
	mov	rax, qword ptr [rbp - 8]
	mov	rax, qword ptr [rax + 32]
	imul	rcx, qword ptr [rbp - 16], 40
	add	rax, rcx
	mov	edx, dword ptr [rax + 8]
	and	edx, 2
	cmp	edx, 0
	je	LBB0_22
## %bb.21:                              ##   in Loop: Header=BB0_15 Depth=1
	mov	rax, qword ptr [rbp - 16]
	add	rax, 1
	mov	qword ptr [rbp - 16], rax
	jmp	LBB0_15
LBB0_22:                                ##   in Loop: Header=BB0_15 Depth=1
	xor	esi, esi
	mov	rax, qword ptr [rbp - 8]
	mov	rax, qword ptr [rax + 40]
	imul	rcx, qword ptr [rbp - 32], 40
	add	rax, rcx
	mov	rcx, qword ptr [rbp - 8]
	mov	rcx, qword ptr [rcx + 32]
	imul	rdx, qword ptr [rbp - 16], 40
	add	rcx, rdx
	mov	rdi, rax
	mov	dword ptr [rbp - 52], esi ## 4-byte Spill
	mov	rsi, rcx
	mov	eax, 40
	mov	rdx, rax
	mov	qword ptr [rbp - 64], rax ## 8-byte Spill
	call	_memcpy
	mov	rax, qword ptr [rbp - 32]
	add	rax, 1
	mov	qword ptr [rbp - 32], rax
	mov	rax, qword ptr [rbp - 8]
	mov	rax, qword ptr [rax + 32]
	imul	rcx, qword ptr [rbp - 16], 40
	add	rax, rcx
	mov	rdi, rax
	mov	esi, dword ptr [rbp - 52] ## 4-byte Reload
	mov	rdx, qword ptr [rbp - 64] ## 8-byte Reload
	mov	rcx, -1
	call	___memset_chk
	mov	rcx, qword ptr [rbp - 16]
	mov	qword ptr [rbp - 24], rcx
LBB0_23:                                ##   Parent Loop BB0_15 Depth=1
                                        ## =>  This Inner Loop Header: Depth=2
	mov	rax, qword ptr [rbp - 24]
	add	rax, 1
	mov	rcx, qword ptr [rbp - 8]
	xor	edx, edx
                                        ## kill: def $rdx killed $edx
	div	qword ptr [rcx + 72]
	mov	qword ptr [rbp - 40], rdx
	mov	rcx, qword ptr [rbp - 8]
	mov	rcx, qword ptr [rcx + 32]
	imul	rdx, qword ptr [rbp - 40], 40
	add	rcx, rdx
	mov	rcx, qword ptr [rcx + 24]
	mov	qword ptr [rbp - 48], rcx
	cmp	qword ptr [rbp - 48], 0
	je	LBB0_26
## %bb.24:                              ##   in Loop: Header=BB0_23 Depth=2
	mov	rdi, qword ptr [rbp - 8]
	mov	rsi, qword ptr [rbp - 40]
	mov	rdx, qword ptr [rbp - 48]
	call	_tgc_probe
	cmp	rax, 0
	jbe	LBB0_26
## %bb.25:                              ##   in Loop: Header=BB0_23 Depth=2
	mov	rax, qword ptr [rbp - 8]
	mov	rax, qword ptr [rax + 32]
	imul	rcx, qword ptr [rbp - 24], 40
	add	rax, rcx
	mov	rcx, qword ptr [rbp - 8]
	mov	rcx, qword ptr [rcx + 32]
	imul	rdx, qword ptr [rbp - 40], 40
	add	rcx, rdx
	mov	rdi, rax
	mov	rsi, rcx
	mov	edx, 40
	mov	rcx, -1
	call	___memcpy_chk
	xor	esi, esi
	mov	rcx, qword ptr [rbp - 8]
	mov	rcx, qword ptr [rcx + 32]
	imul	rdx, qword ptr [rbp - 40], 40
	add	rcx, rdx
	mov	rdi, rcx
	mov	edx, 40
	mov	rcx, -1
	mov	qword ptr [rbp - 72], rax ## 8-byte Spill
	call	___memset_chk
	mov	rcx, qword ptr [rbp - 40]
	mov	qword ptr [rbp - 24], rcx
	jmp	LBB0_27
LBB0_26:                                ##   in Loop: Header=BB0_15 Depth=1
	jmp	LBB0_28
LBB0_27:                                ##   in Loop: Header=BB0_23 Depth=2
	jmp	LBB0_23
LBB0_28:                                ##   in Loop: Header=BB0_15 Depth=1
	mov	rax, qword ptr [rbp - 8]
	mov	rcx, qword ptr [rax + 64]
	add	rcx, -1
	mov	qword ptr [rax + 64], rcx
	jmp	LBB0_15
LBB0_29:
	mov	qword ptr [rbp - 16], 0
LBB0_30:                                ## =>This Inner Loop Header: Depth=1
	mov	rax, qword ptr [rbp - 16]
	mov	rcx, qword ptr [rbp - 8]
	cmp	rax, qword ptr [rcx + 72]
	jae	LBB0_37
## %bb.31:                              ##   in Loop: Header=BB0_30 Depth=1
	mov	rax, qword ptr [rbp - 8]
	mov	rax, qword ptr [rax + 32]
	imul	rcx, qword ptr [rbp - 16], 40
	add	rax, rcx
	cmp	qword ptr [rax + 24], 0
	jne	LBB0_33
## %bb.32:                              ##   in Loop: Header=BB0_30 Depth=1
	jmp	LBB0_36
LBB0_33:                                ##   in Loop: Header=BB0_30 Depth=1
	mov	rax, qword ptr [rbp - 8]
	mov	rax, qword ptr [rax + 32]
	imul	rcx, qword ptr [rbp - 16], 40
	add	rax, rcx
	mov	edx, dword ptr [rax + 8]
	and	edx, 1
	cmp	edx, 0
	je	LBB0_35
## %bb.34:                              ##   in Loop: Header=BB0_30 Depth=1
	mov	rax, qword ptr [rbp - 8]
	mov	rax, qword ptr [rax + 32]
	imul	rcx, qword ptr [rbp - 16], 40
	add	rax, rcx
	mov	edx, dword ptr [rax + 8]
	and	edx, -2
	mov	dword ptr [rax + 8], edx
LBB0_35:                                ##   in Loop: Header=BB0_30 Depth=1
	jmp	LBB0_36
LBB0_36:                                ##   in Loop: Header=BB0_30 Depth=1
	mov	rax, qword ptr [rbp - 16]
	add	rax, 1
	mov	qword ptr [rbp - 16], rax
	jmp	LBB0_30
LBB0_37:
	mov	rdi, qword ptr [rbp - 8]
	call	_tgc_resize_less
	mov	rcx, qword ptr [rbp - 8]
	mov	rdx, qword ptr [rcx + 64]
	movq	xmm0, rdx
	movaps	xmm1, xmmword ptr [rip + LCPI0_0] ## xmm1 = [1127219200,1160773632,0,0]
	punpckldq	xmm0, xmm1      ## xmm0 = xmm0[0],xmm1[0],xmm0[1],xmm1[1]
	movapd	xmm1, xmmword ptr [rip + LCPI0_1] ## xmm1 = [4.503599627370496E+15,1.9342813113834067E+25]
	subpd	xmm0, xmm1
	movaps	xmm1, xmm0
	unpckhpd	xmm0, xmm0      ## xmm0 = xmm0[1,1]
	addsd	xmm0, xmm1
	movsd	xmm1, qword ptr [rcx + 56] ## xmm1 = mem[0],zero
	mulsd	xmm0, xmm1
	movsd	xmm1, qword ptr [rip + LCPI0_2] ## xmm1 = mem[0],zero
	movaps	xmm2, xmm0
	subsd	xmm2, xmm1
	cvttsd2si	rcx, xmm2
	movabs	rsi, -9223372036854775808
	xor	rcx, rsi
	cvttsd2si	rsi, xmm0
	ucomisd	xmm0, xmm1
	cmovb	rcx, rsi
	add	rdx, rcx
	add	rdx, 1
	mov	rcx, qword ptr [rbp - 8]
	mov	qword ptr [rcx + 80], rdx
	mov	qword ptr [rbp - 16], 0
LBB0_38:                                ## =>This Inner Loop Header: Depth=1
	mov	rax, qword ptr [rbp - 16]
	mov	rcx, qword ptr [rbp - 8]
	cmp	rax, qword ptr [rcx + 88]
	jae	LBB0_45
## %bb.39:                              ##   in Loop: Header=BB0_38 Depth=1
	mov	rax, qword ptr [rbp - 8]
	mov	rax, qword ptr [rax + 40]
	imul	rcx, qword ptr [rbp - 16], 40
	add	rax, rcx
	cmp	qword ptr [rax], 0
	je	LBB0_43
## %bb.40:                              ##   in Loop: Header=BB0_38 Depth=1
	mov	rax, qword ptr [rbp - 8]
	mov	rax, qword ptr [rax + 40]
	imul	rcx, qword ptr [rbp - 16], 40
	add	rax, rcx
	cmp	qword ptr [rax + 32], 0
	je	LBB0_42
## %bb.41:                              ##   in Loop: Header=BB0_38 Depth=1
	mov	rax, qword ptr [rbp - 8]
	mov	rax, qword ptr [rax + 40]
	imul	rcx, qword ptr [rbp - 16], 40
	add	rax, rcx
	mov	rax, qword ptr [rax + 32]
	mov	rcx, qword ptr [rbp - 8]
	mov	rcx, qword ptr [rcx + 40]
	imul	rdx, qword ptr [rbp - 16], 40
	add	rcx, rdx
	mov	rdi, qword ptr [rcx]
	call	rax
LBB0_42:                                ##   in Loop: Header=BB0_38 Depth=1
	mov	rax, qword ptr [rbp - 8]
	mov	rax, qword ptr [rax + 40]
	imul	rcx, qword ptr [rbp - 16], 40
	add	rax, rcx
	mov	rdi, qword ptr [rax]
	call	_free
LBB0_43:                                ##   in Loop: Header=BB0_38 Depth=1
	jmp	LBB0_44
LBB0_44:                                ##   in Loop: Header=BB0_38 Depth=1
	mov	rax, qword ptr [rbp - 16]
	add	rax, 1
	mov	qword ptr [rbp - 16], rax
	jmp	LBB0_38
LBB0_45:
	mov	rax, qword ptr [rbp - 8]
	mov	rax, qword ptr [rax + 40]
	mov	rdi, rax
	call	_free
	mov	rax, qword ptr [rbp - 8]
	mov	qword ptr [rax + 40], 0
	mov	rax, qword ptr [rbp - 8]
	mov	qword ptr [rax + 88], 0
LBB0_46:
	add	rsp, 80
	pop	rbp
	ret
	.cfi_endproc
                                        ## -- End function
	.p2align	4, 0x90         ## -- Begin function tgc_probe
_tgc_probe:                             ## @tgc_probe
	.cfi_startproc
## %bb.0:
	push	rbp
	.cfi_def_cfa_offset 16
	.cfi_offset rbp, -16
	mov	rbp, rsp
	.cfi_def_cfa_register rbp
	mov	qword ptr [rbp - 8], rdi
	mov	qword ptr [rbp - 16], rsi
	mov	qword ptr [rbp - 24], rdx
	mov	rax, qword ptr [rbp - 16]
	mov	rcx, qword ptr [rbp - 24]
	sub	rcx, 1
	sub	rax, rcx
	mov	qword ptr [rbp - 32], rax
	cmp	qword ptr [rbp - 32], 0
	jge	LBB1_2
## %bb.1:
	mov	rax, qword ptr [rbp - 8]
	mov	rax, qword ptr [rax + 72]
	add	rax, qword ptr [rbp - 32]
	mov	qword ptr [rbp - 32], rax
LBB1_2:
	mov	rax, qword ptr [rbp - 32]
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
	sub	rsp, 32
	mov	qword ptr [rbp - 8], rdi
	mov	rdi, qword ptr [rbp - 8]
	mov	rax, qword ptr [rbp - 8]
	mov	rsi, qword ptr [rax + 64]
	call	_tgc_ideal_size
	mov	qword ptr [rbp - 16], rax
	mov	rax, qword ptr [rbp - 8]
	mov	rax, qword ptr [rax + 72]
	mov	qword ptr [rbp - 24], rax
	mov	rax, qword ptr [rbp - 16]
	cmp	rax, qword ptr [rbp - 24]
	jae	LBB2_2
## %bb.1:
	mov	rdi, qword ptr [rbp - 8]
	mov	rsi, qword ptr [rbp - 16]
	call	_tgc_rehash
	mov	dword ptr [rbp - 28], eax ## 4-byte Spill
	jmp	LBB2_3
LBB2_2:
	mov	eax, 1
	mov	dword ptr [rbp - 28], eax ## 4-byte Spill
	jmp	LBB2_3
LBB2_3:
	mov	eax, dword ptr [rbp - 28] ## 4-byte Reload
	add	rsp, 32
	pop	rbp
	ret
	.cfi_endproc
                                        ## -- End function
	.section	__TEXT,__literal8,8byte_literals
	.p2align	3               ## -- Begin function tgc_start
LCPI3_0:
	.quad	4602678819172646912     ## double 0.5
LCPI3_1:
	.quad	4606281698874543309     ## double 0.90000000000000002
	.section	__TEXT,__text,regular,pure_instructions
	.globl	_tgc_start
	.p2align	4, 0x90
_tgc_start:                             ## @tgc_start
	.cfi_startproc
## %bb.0:
	push	rbp
	.cfi_def_cfa_offset 16
	.cfi_offset rbp, -16
	mov	rbp, rsp
	.cfi_def_cfa_register rbp
	movsd	xmm0, qword ptr [rip + LCPI3_0] ## xmm0 = mem[0],zero
	movsd	xmm1, qword ptr [rip + LCPI3_1] ## xmm1 = mem[0],zero
	mov	qword ptr [rbp - 8], rdi
	mov	qword ptr [rbp - 16], rsi
	mov	rax, qword ptr [rbp - 16]
	mov	rcx, qword ptr [rbp - 8]
	mov	qword ptr [rcx], rax
	mov	rax, qword ptr [rbp - 8]
	mov	dword ptr [rax + 8], 0
	mov	rax, qword ptr [rbp - 8]
	mov	qword ptr [rax + 64], 0
	mov	rax, qword ptr [rbp - 8]
	mov	qword ptr [rax + 72], 0
	mov	rax, qword ptr [rbp - 8]
	mov	qword ptr [rax + 80], 0
	mov	rax, qword ptr [rbp - 8]
	mov	qword ptr [rax + 88], 0
	mov	rax, qword ptr [rbp - 8]
	mov	qword ptr [rax + 24], 0
	mov	rax, qword ptr [rbp - 8]
	mov	qword ptr [rax + 32], 0
	mov	rax, qword ptr [rbp - 8]
	mov	qword ptr [rax + 40], 0
	mov	rax, qword ptr [rbp - 8]
	mov	qword ptr [rax + 16], -1
	mov	rax, qword ptr [rbp - 8]
	movsd	qword ptr [rax + 48], xmm1
	mov	rax, qword ptr [rbp - 8]
	movsd	qword ptr [rax + 56], xmm0
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
	sub	rsp, 16
	mov	qword ptr [rbp - 8], rdi
	mov	rdi, qword ptr [rbp - 8]
	call	_tgc_sweep
	mov	rax, qword ptr [rbp - 8]
	mov	rax, qword ptr [rax + 32]
	mov	rdi, rax
	call	_free
	mov	rax, qword ptr [rbp - 8]
	mov	rax, qword ptr [rax + 40]
	mov	rdi, rax
	call	_free
	add	rsp, 16
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
	mov	qword ptr [rbp - 8], rdi
	mov	rax, qword ptr [rbp - 8]
	mov	dword ptr [rax + 8], 1
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
	mov	qword ptr [rbp - 8], rdi
	mov	rax, qword ptr [rbp - 8]
	mov	dword ptr [rax + 8], 0
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
	sub	rsp, 16
	mov	qword ptr [rbp - 8], rdi
	mov	rdi, qword ptr [rbp - 8]
	call	_tgc_mark
	mov	rdi, qword ptr [rbp - 8]
	call	_tgc_sweep
	add	rsp, 16
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
	sub	rsp, 208
	mov	rax, qword ptr [rip + ___stack_chk_guard@GOTPCREL]
	mov	rax, qword ptr [rax]
	mov	qword ptr [rbp - 8], rax
	mov	qword ptr [rbp - 168], rdi
	lea	rax, [rip + _tgc_mark_stack]
	mov	qword ptr [rbp - 192], rax
	mov	rax, qword ptr [rbp - 168]
	cmp	qword ptr [rax + 64], 0
	jne	LBB8_2
## %bb.1:
	jmp	LBB8_19
LBB8_2:
	mov	qword ptr [rbp - 176], 0
LBB8_3:                                 ## =>This Loop Header: Depth=1
                                        ##     Child Loop BB8_12 Depth 2
	mov	rax, qword ptr [rbp - 176]
	mov	rcx, qword ptr [rbp - 168]
	cmp	rax, qword ptr [rcx + 72]
	jae	LBB8_18
## %bb.4:                               ##   in Loop: Header=BB8_3 Depth=1
	mov	rax, qword ptr [rbp - 168]
	mov	rax, qword ptr [rax + 32]
	imul	rcx, qword ptr [rbp - 176], 40
	add	rax, rcx
	cmp	qword ptr [rax + 24], 0
	jne	LBB8_6
## %bb.5:                               ##   in Loop: Header=BB8_3 Depth=1
	jmp	LBB8_17
LBB8_6:                                 ##   in Loop: Header=BB8_3 Depth=1
	mov	rax, qword ptr [rbp - 168]
	mov	rax, qword ptr [rax + 32]
	imul	rcx, qword ptr [rbp - 176], 40
	add	rax, rcx
	mov	edx, dword ptr [rax + 8]
	and	edx, 1
	cmp	edx, 0
	je	LBB8_8
## %bb.7:                               ##   in Loop: Header=BB8_3 Depth=1
	jmp	LBB8_17
LBB8_8:                                 ##   in Loop: Header=BB8_3 Depth=1
	mov	rax, qword ptr [rbp - 168]
	mov	rax, qword ptr [rax + 32]
	imul	rcx, qword ptr [rbp - 176], 40
	add	rax, rcx
	mov	edx, dword ptr [rax + 8]
	and	edx, 2
	cmp	edx, 0
	je	LBB8_16
## %bb.9:                               ##   in Loop: Header=BB8_3 Depth=1
	mov	rax, qword ptr [rbp - 168]
	mov	rax, qword ptr [rax + 32]
	imul	rcx, qword ptr [rbp - 176], 40
	add	rax, rcx
	mov	edx, dword ptr [rax + 8]
	or	edx, 1
	mov	dword ptr [rax + 8], edx
	mov	rax, qword ptr [rbp - 168]
	mov	rax, qword ptr [rax + 32]
	imul	rcx, qword ptr [rbp - 176], 40
	add	rax, rcx
	mov	edx, dword ptr [rax + 8]
	and	edx, 4
	cmp	edx, 0
	je	LBB8_11
## %bb.10:                              ##   in Loop: Header=BB8_3 Depth=1
	jmp	LBB8_17
LBB8_11:                                ##   in Loop: Header=BB8_3 Depth=1
	mov	qword ptr [rbp - 184], 0
LBB8_12:                                ##   Parent Loop BB8_3 Depth=1
                                        ## =>  This Inner Loop Header: Depth=2
	mov	rax, qword ptr [rbp - 184]
	mov	rcx, qword ptr [rbp - 168]
	mov	rcx, qword ptr [rcx + 32]
	imul	rdx, qword ptr [rbp - 176], 40
	add	rcx, rdx
	mov	rcx, qword ptr [rcx + 16]
	shr	rcx, 3
	cmp	rax, rcx
	jae	LBB8_15
## %bb.13:                              ##   in Loop: Header=BB8_12 Depth=2
	mov	rdi, qword ptr [rbp - 168]
	mov	rax, qword ptr [rbp - 168]
	mov	rax, qword ptr [rax + 32]
	imul	rcx, qword ptr [rbp - 176], 40
	add	rax, rcx
	mov	rax, qword ptr [rax]
	mov	rcx, qword ptr [rbp - 184]
	mov	rsi, qword ptr [rax + 8*rcx]
	call	_tgc_mark_ptr
## %bb.14:                              ##   in Loop: Header=BB8_12 Depth=2
	mov	rax, qword ptr [rbp - 184]
	add	rax, 1
	mov	qword ptr [rbp - 184], rax
	jmp	LBB8_12
LBB8_15:                                ##   in Loop: Header=BB8_3 Depth=1
	jmp	LBB8_17
LBB8_16:                                ##   in Loop: Header=BB8_3 Depth=1
	jmp	LBB8_17
LBB8_17:                                ##   in Loop: Header=BB8_3 Depth=1
	mov	rax, qword ptr [rbp - 176]
	add	rax, 1
	mov	qword ptr [rbp - 176], rax
	jmp	LBB8_3
LBB8_18:
	lea	rax, [rbp - 160]
	xor	esi, esi
	mov	rcx, rax
	mov	rdi, rcx
	mov	edx, 148
	mov	qword ptr [rbp - 200], rax ## 8-byte Spill
	call	_memset
	mov	rdi, qword ptr [rbp - 200] ## 8-byte Reload
	call	_setjmp
	mov	rcx, qword ptr [rbp - 192]
	mov	rdi, qword ptr [rbp - 168]
	mov	dword ptr [rbp - 204], eax ## 4-byte Spill
	call	rcx
LBB8_19:
	mov	rax, qword ptr [rip + ___stack_chk_guard@GOTPCREL]
	mov	rax, qword ptr [rax]
	mov	rcx, qword ptr [rbp - 8]
	cmp	rax, rcx
	jne	LBB8_21
## %bb.20:
	add	rsp, 208
	pop	rbp
	ret
LBB8_21:
	call	___stack_chk_fail
	ud2
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
	sub	rsp, 16
	xor	edx, edx
	xor	eax, eax
	mov	ecx, eax
	mov	qword ptr [rbp - 8], rdi
	mov	qword ptr [rbp - 16], rsi
	mov	rdi, qword ptr [rbp - 8]
	mov	rsi, qword ptr [rbp - 16]
	call	_tgc_alloc_opt
	add	rsp, 16
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
	sub	rsp, 48
	mov	qword ptr [rbp - 8], rdi
	mov	qword ptr [rbp - 16], rsi
	mov	dword ptr [rbp - 20], edx
	mov	qword ptr [rbp - 32], rcx
	mov	rdi, qword ptr [rbp - 16]
	call	_malloc
	mov	qword ptr [rbp - 40], rax
	cmp	qword ptr [rbp - 40], 0
	je	LBB10_2
## %bb.1:
	mov	rdi, qword ptr [rbp - 8]
	mov	rsi, qword ptr [rbp - 40]
	mov	rdx, qword ptr [rbp - 16]
	mov	ecx, dword ptr [rbp - 20]
	mov	r8, qword ptr [rbp - 32]
	call	_tgc_add
	mov	qword ptr [rbp - 40], rax
LBB10_2:
	mov	rax, qword ptr [rbp - 40]
	add	rsp, 48
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
	sub	rsp, 32
	xor	ecx, ecx
	xor	eax, eax
	mov	r8d, eax
	mov	qword ptr [rbp - 8], rdi
	mov	qword ptr [rbp - 16], rsi
	mov	qword ptr [rbp - 24], rdx
	mov	rdi, qword ptr [rbp - 8]
	mov	rsi, qword ptr [rbp - 16]
	mov	rdx, qword ptr [rbp - 24]
	call	_tgc_calloc_opt
	add	rsp, 32
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
	sub	rsp, 48
	mov	qword ptr [rbp - 8], rdi
	mov	qword ptr [rbp - 16], rsi
	mov	qword ptr [rbp - 24], rdx
	mov	dword ptr [rbp - 28], ecx
	mov	qword ptr [rbp - 40], r8
	mov	rdi, qword ptr [rbp - 16]
	mov	rsi, qword ptr [rbp - 24]
	call	_calloc
	mov	qword ptr [rbp - 48], rax
	cmp	qword ptr [rbp - 48], 0
	je	LBB12_2
## %bb.1:
	mov	rdi, qword ptr [rbp - 8]
	mov	rsi, qword ptr [rbp - 48]
	mov	rax, qword ptr [rbp - 16]
	imul	rax, qword ptr [rbp - 24]
	mov	ecx, dword ptr [rbp - 28]
	mov	r8, qword ptr [rbp - 40]
	mov	rdx, rax
	call	_tgc_add
	mov	qword ptr [rbp - 48], rax
LBB12_2:
	mov	rax, qword ptr [rbp - 48]
	add	rsp, 48
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
	sub	rsp, 64
	mov	qword ptr [rbp - 16], rdi
	mov	qword ptr [rbp - 24], rsi
	mov	qword ptr [rbp - 32], rdx
	mov	rdi, qword ptr [rbp - 24]
	mov	rsi, qword ptr [rbp - 32]
	call	_realloc
	mov	qword ptr [rbp - 48], rax
	cmp	qword ptr [rbp - 48], 0
	jne	LBB13_2
## %bb.1:
	mov	rdi, qword ptr [rbp - 16]
	mov	rsi, qword ptr [rbp - 24]
	call	_tgc_rem
	mov	rax, qword ptr [rbp - 48]
	mov	qword ptr [rbp - 8], rax
	jmp	LBB13_11
LBB13_2:
	cmp	qword ptr [rbp - 24], 0
	jne	LBB13_4
## %bb.3:
	xor	ecx, ecx
	xor	eax, eax
	mov	r8d, eax
	mov	rdi, qword ptr [rbp - 16]
	mov	rsi, qword ptr [rbp - 48]
	mov	rdx, qword ptr [rbp - 32]
	call	_tgc_add
	mov	rdx, qword ptr [rbp - 48]
	mov	qword ptr [rbp - 8], rdx
	jmp	LBB13_11
LBB13_4:
	mov	rdi, qword ptr [rbp - 16]
	mov	rsi, qword ptr [rbp - 24]
	call	_tgc_get_ptr
	mov	qword ptr [rbp - 40], rax
	cmp	qword ptr [rbp - 40], 0
	je	LBB13_7
## %bb.5:
	mov	rax, qword ptr [rbp - 48]
	cmp	rax, qword ptr [rbp - 24]
	jne	LBB13_7
## %bb.6:
	mov	rax, qword ptr [rbp - 32]
	mov	rcx, qword ptr [rbp - 40]
	mov	qword ptr [rcx + 16], rax
	mov	rax, qword ptr [rbp - 48]
	mov	qword ptr [rbp - 8], rax
	jmp	LBB13_11
LBB13_7:
	cmp	qword ptr [rbp - 40], 0
	je	LBB13_10
## %bb.8:
	mov	rax, qword ptr [rbp - 48]
	cmp	rax, qword ptr [rbp - 24]
	je	LBB13_10
## %bb.9:
	mov	rax, qword ptr [rbp - 40]
	mov	ecx, dword ptr [rax + 8]
	mov	dword ptr [rbp - 52], ecx
	mov	rax, qword ptr [rbp - 40]
	mov	rax, qword ptr [rax + 32]
	mov	qword ptr [rbp - 64], rax
	mov	rdi, qword ptr [rbp - 16]
	mov	rsi, qword ptr [rbp - 24]
	call	_tgc_rem
	mov	rdi, qword ptr [rbp - 16]
	mov	rsi, qword ptr [rbp - 48]
	mov	rdx, qword ptr [rbp - 32]
	mov	ecx, dword ptr [rbp - 52]
	mov	r8, qword ptr [rbp - 64]
	call	_tgc_add
	mov	rdx, qword ptr [rbp - 48]
	mov	qword ptr [rbp - 8], rdx
	jmp	LBB13_11
LBB13_10:
	mov	qword ptr [rbp - 8], 0
LBB13_11:
	mov	rax, qword ptr [rbp - 8]
	add	rsp, 64
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
	sub	rsp, 16
	mov	qword ptr [rbp - 8], rdi
	mov	qword ptr [rbp - 16], rsi
	mov	rdi, qword ptr [rbp - 8]
	mov	rsi, qword ptr [rbp - 16]
	call	_tgc_rem_ptr
	mov	rdi, qword ptr [rbp - 8]
	call	_tgc_resize_less
	mov	rcx, qword ptr [rbp - 8]
	mov	rcx, qword ptr [rcx + 64]
	mov	rdx, qword ptr [rbp - 8]
	mov	rdx, qword ptr [rdx + 64]
	shr	rdx, 1
	add	rcx, rdx
	add	rcx, 1
	mov	rdx, qword ptr [rbp - 8]
	mov	qword ptr [rdx + 80], rcx
	add	rsp, 16
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
	sub	rsp, 64
	mov	qword ptr [rbp - 16], rdi
	mov	qword ptr [rbp - 24], rsi
	mov	qword ptr [rbp - 32], rdx
	mov	dword ptr [rbp - 36], ecx
	mov	qword ptr [rbp - 48], r8
	mov	rax, qword ptr [rbp - 16]
	mov	rdx, qword ptr [rax + 64]
	add	rdx, 1
	mov	qword ptr [rax + 64], rdx
	mov	rax, qword ptr [rbp - 24]
	add	rax, qword ptr [rbp - 32]
	mov	rdx, qword ptr [rbp - 16]
	cmp	rax, qword ptr [rdx + 24]
	jbe	LBB15_2
## %bb.1:
	mov	rax, qword ptr [rbp - 24]
	add	rax, qword ptr [rbp - 32]
	mov	qword ptr [rbp - 56], rax ## 8-byte Spill
	jmp	LBB15_3
LBB15_2:
	mov	rax, qword ptr [rbp - 16]
	mov	rax, qword ptr [rax + 24]
	mov	qword ptr [rbp - 56], rax ## 8-byte Spill
LBB15_3:
	mov	rax, qword ptr [rbp - 56] ## 8-byte Reload
	mov	rcx, qword ptr [rbp - 16]
	mov	qword ptr [rcx + 24], rax
	mov	rax, qword ptr [rbp - 24]
	mov	rcx, qword ptr [rbp - 16]
	cmp	rax, qword ptr [rcx + 16]
	jae	LBB15_5
## %bb.4:
	mov	rax, qword ptr [rbp - 24]
	mov	qword ptr [rbp - 64], rax ## 8-byte Spill
	jmp	LBB15_6
LBB15_5:
	mov	rax, qword ptr [rbp - 16]
	mov	rax, qword ptr [rax + 16]
	mov	qword ptr [rbp - 64], rax ## 8-byte Spill
LBB15_6:
	mov	rax, qword ptr [rbp - 64] ## 8-byte Reload
	mov	rcx, qword ptr [rbp - 16]
	mov	qword ptr [rcx + 16], rax
	mov	rdi, qword ptr [rbp - 16]
	call	_tgc_resize_more
	cmp	eax, 0
	je	LBB15_11
## %bb.7:
	mov	rdi, qword ptr [rbp - 16]
	mov	rsi, qword ptr [rbp - 24]
	mov	rdx, qword ptr [rbp - 32]
	mov	ecx, dword ptr [rbp - 36]
	mov	r8, qword ptr [rbp - 48]
	call	_tgc_add_ptr
	mov	rax, qword ptr [rbp - 16]
	cmp	dword ptr [rax + 8], 0
	jne	LBB15_10
## %bb.8:
	mov	rax, qword ptr [rbp - 16]
	mov	rax, qword ptr [rax + 64]
	mov	rcx, qword ptr [rbp - 16]
	cmp	rax, qword ptr [rcx + 80]
	jbe	LBB15_10
## %bb.9:
	mov	rdi, qword ptr [rbp - 16]
	call	_tgc_run
LBB15_10:
	mov	rax, qword ptr [rbp - 24]
	mov	qword ptr [rbp - 8], rax
	jmp	LBB15_12
LBB15_11:
	mov	rax, qword ptr [rbp - 16]
	mov	rcx, qword ptr [rax + 64]
	add	rcx, -1
	mov	qword ptr [rax + 64], rcx
	mov	rdi, qword ptr [rbp - 24]
	call	_free
	mov	qword ptr [rbp - 8], 0
LBB15_12:
	mov	rax, qword ptr [rbp - 8]
	add	rsp, 64
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
	sub	rsp, 64
	mov	qword ptr [rbp - 16], rdi
	mov	qword ptr [rbp - 24], rsi
	mov	rdi, qword ptr [rbp - 24]
	call	_tgc_hash
	mov	rcx, qword ptr [rbp - 16]
	xor	edx, edx
                                        ## kill: def $rdx killed $edx
	div	qword ptr [rcx + 72]
	mov	qword ptr [rbp - 32], rdx
	mov	qword ptr [rbp - 40], 0
LBB16_1:                                ## =>This Inner Loop Header: Depth=1
	mov	rax, qword ptr [rbp - 16]
	mov	rax, qword ptr [rax + 32]
	imul	rcx, qword ptr [rbp - 32], 40
	add	rax, rcx
	mov	rax, qword ptr [rax + 24]
	mov	qword ptr [rbp - 48], rax
	cmp	qword ptr [rbp - 48], 0
	je	LBB16_3
## %bb.2:                               ##   in Loop: Header=BB16_1 Depth=1
	mov	rax, qword ptr [rbp - 40]
	mov	rdi, qword ptr [rbp - 16]
	mov	rsi, qword ptr [rbp - 32]
	mov	rdx, qword ptr [rbp - 48]
	mov	qword ptr [rbp - 56], rax ## 8-byte Spill
	call	_tgc_probe
	mov	rcx, qword ptr [rbp - 56] ## 8-byte Reload
	cmp	rcx, rax
	jbe	LBB16_4
LBB16_3:
	mov	qword ptr [rbp - 8], 0
	jmp	LBB16_7
LBB16_4:                                ##   in Loop: Header=BB16_1 Depth=1
	mov	rax, qword ptr [rbp - 16]
	mov	rax, qword ptr [rax + 32]
	imul	rcx, qword ptr [rbp - 32], 40
	add	rax, rcx
	mov	rax, qword ptr [rax]
	cmp	rax, qword ptr [rbp - 24]
	jne	LBB16_6
## %bb.5:
	mov	rax, qword ptr [rbp - 16]
	mov	rax, qword ptr [rax + 32]
	imul	rcx, qword ptr [rbp - 32], 40
	add	rax, rcx
	mov	qword ptr [rbp - 8], rax
	jmp	LBB16_7
LBB16_6:                                ##   in Loop: Header=BB16_1 Depth=1
	mov	rax, qword ptr [rbp - 32]
	add	rax, 1
	mov	rcx, qword ptr [rbp - 16]
	xor	edx, edx
                                        ## kill: def $rdx killed $edx
	div	qword ptr [rcx + 72]
	mov	qword ptr [rbp - 32], rdx
	mov	rcx, qword ptr [rbp - 40]
	add	rcx, 1
	mov	qword ptr [rbp - 40], rcx
	jmp	LBB16_1
LBB16_7:
	mov	rax, qword ptr [rbp - 8]
	add	rsp, 64
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
	sub	rsp, 32
	mov	qword ptr [rbp - 8], rdi
	mov	qword ptr [rbp - 16], rsi
	mov	rdi, qword ptr [rbp - 8]
	mov	rsi, qword ptr [rbp - 16]
	call	_tgc_get_ptr
	mov	qword ptr [rbp - 24], rax
	cmp	qword ptr [rbp - 24], 0
	je	LBB17_4
## %bb.1:
	mov	rax, qword ptr [rbp - 24]
	cmp	qword ptr [rax + 32], 0
	je	LBB17_3
## %bb.2:
	mov	rax, qword ptr [rbp - 24]
	mov	rax, qword ptr [rax + 32]
	mov	rdi, qword ptr [rbp - 16]
	call	rax
LBB17_3:
	mov	rdi, qword ptr [rbp - 16]
	call	_free
	mov	rdi, qword ptr [rbp - 8]
	mov	rsi, qword ptr [rbp - 16]
	call	_tgc_rem
LBB17_4:
	add	rsp, 32
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
	sub	rsp, 32
	mov	qword ptr [rbp - 8], rdi
	mov	qword ptr [rbp - 16], rsi
	mov	qword ptr [rbp - 24], rdx
	mov	rdi, qword ptr [rbp - 8]
	mov	rsi, qword ptr [rbp - 16]
	call	_tgc_get_ptr
	mov	qword ptr [rbp - 32], rax
	cmp	qword ptr [rbp - 32], 0
	je	LBB18_2
## %bb.1:
	mov	rax, qword ptr [rbp - 24]
	mov	rcx, qword ptr [rbp - 32]
	mov	qword ptr [rcx + 32], rax
LBB18_2:
	add	rsp, 32
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
	sub	rsp, 32
	mov	qword ptr [rbp - 8], rdi
	mov	qword ptr [rbp - 16], rsi
	mov	dword ptr [rbp - 20], edx
	mov	rdi, qword ptr [rbp - 8]
	mov	rsi, qword ptr [rbp - 16]
	call	_tgc_get_ptr
	mov	qword ptr [rbp - 32], rax
	cmp	qword ptr [rbp - 32], 0
	je	LBB19_2
## %bb.1:
	mov	eax, dword ptr [rbp - 20]
	mov	rcx, qword ptr [rbp - 32]
	mov	dword ptr [rcx + 8], eax
LBB19_2:
	add	rsp, 32
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
	sub	rsp, 32
	mov	qword ptr [rbp - 16], rdi
	mov	qword ptr [rbp - 24], rsi
	mov	rdi, qword ptr [rbp - 16]
	mov	rsi, qword ptr [rbp - 24]
	call	_tgc_get_ptr
	mov	qword ptr [rbp - 32], rax
	cmp	qword ptr [rbp - 32], 0
	je	LBB20_2
## %bb.1:
	mov	rax, qword ptr [rbp - 32]
	mov	ecx, dword ptr [rax + 8]
	mov	dword ptr [rbp - 4], ecx
	jmp	LBB20_3
LBB20_2:
	mov	dword ptr [rbp - 4], 0
LBB20_3:
	mov	eax, dword ptr [rbp - 4]
	add	rsp, 32
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
	sub	rsp, 32
	mov	qword ptr [rbp - 16], rdi
	mov	qword ptr [rbp - 24], rsi
	mov	rdi, qword ptr [rbp - 16]
	mov	rsi, qword ptr [rbp - 24]
	call	_tgc_get_ptr
	mov	qword ptr [rbp - 32], rax
	cmp	qword ptr [rbp - 32], 0
	je	LBB21_2
## %bb.1:
	mov	rax, qword ptr [rbp - 32]
	mov	rax, qword ptr [rax + 32]
	mov	qword ptr [rbp - 8], rax
	jmp	LBB21_3
LBB21_2:
	mov	qword ptr [rbp - 8], 0
LBB21_3:
	mov	rax, qword ptr [rbp - 8]
	add	rsp, 32
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
	sub	rsp, 32
	mov	qword ptr [rbp - 16], rdi
	mov	qword ptr [rbp - 24], rsi
	mov	rdi, qword ptr [rbp - 16]
	mov	rsi, qword ptr [rbp - 24]
	call	_tgc_get_ptr
	mov	qword ptr [rbp - 32], rax
	cmp	qword ptr [rbp - 32], 0
	je	LBB22_2
## %bb.1:
	mov	rax, qword ptr [rbp - 32]
	mov	rax, qword ptr [rax + 16]
	mov	qword ptr [rbp - 8], rax
	jmp	LBB22_3
LBB22_2:
	mov	qword ptr [rbp - 8], 0
LBB22_3:
	mov	rax, qword ptr [rbp - 8]
	add	rsp, 32
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
	lea	rax, [rbp - 16]
	mov	rcx, qword ptr [rip + ___stack_chk_guard@GOTPCREL]
	mov	rcx, qword ptr [rcx]
	mov	qword ptr [rbp - 8], rcx
	mov	rcx, qword ptr [rip + L___const.begin_gc.stack_var]
	mov	qword ptr [rbp - 16], rcx
	lea	rdi, [rip + _gc]
	mov	rsi, rax
	call	_tgc_start
	mov	rax, qword ptr [rip + ___stack_chk_guard@GOTPCREL]
	mov	rax, qword ptr [rax]
	mov	rcx, qword ptr [rbp - 8]
	cmp	rax, rcx
	jne	LBB23_2
## %bb.1:
	add	rsp, 16
	pop	rbp
	ret
LBB23_2:
	call	___stack_chk_fail
	ud2
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
	sub	rsp, 16
	mov	qword ptr [rbp - 8], rdi
	mov	rsi, qword ptr [rbp - 8]
	lea	rdi, [rip + _gc]
	call	_tgc_alloc
	add	rsp, 16
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
	.section	__TEXT,__literal16,16byte_literals
	.p2align	4               ## -- Begin function tgc_ideal_size
LCPI26_0:
	.long	1127219200              ## 0x43300000
	.long	1160773632              ## 0x45300000
	.long	0                       ## 0x0
	.long	0                       ## 0x0
LCPI26_1:
	.quad	4841369599423283200     ## double 4503599627370496
	.quad	4985484787499139072     ## double 1.9342813113834067E+25
	.section	__TEXT,__literal8,8byte_literals
	.p2align	3
LCPI26_2:
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
	mov	qword ptr [rbp - 16], rdi
	mov	qword ptr [rbp - 24], rsi
	mov	rax, qword ptr [rbp - 24]
	inc	rax
	movq	xmm0, rax
	movaps	xmm1, xmmword ptr [rip + LCPI26_0] ## xmm1 = [1127219200,1160773632,0,0]
	punpckldq	xmm0, xmm1      ## xmm0 = xmm0[0],xmm1[0],xmm0[1],xmm1[1]
	movapd	xmm1, xmmword ptr [rip + LCPI26_1] ## xmm1 = [4.503599627370496E+15,1.9342813113834067E+25]
	subpd	xmm0, xmm1
	movaps	xmm1, xmm0
	unpckhpd	xmm0, xmm0      ## xmm0 = xmm0[1,1]
	addsd	xmm0, xmm1
	mov	rax, qword ptr [rbp - 16]
	movsd	xmm1, qword ptr [rax + 48] ## xmm1 = mem[0],zero
	divsd	xmm0, xmm1
	movsd	xmm1, qword ptr [rip + LCPI26_2] ## xmm1 = mem[0],zero
	movaps	xmm2, xmm0
	subsd	xmm2, xmm1
	cvttsd2si	rax, xmm2
	movabs	rcx, -9223372036854775808
	xor	rax, rcx
	cvttsd2si	rcx, xmm0
	ucomisd	xmm0, xmm1
	cmovb	rax, rcx
	mov	qword ptr [rbp - 24], rax
	mov	qword ptr [rbp - 32], 0
LBB26_1:                                ## =>This Inner Loop Header: Depth=1
	cmp	qword ptr [rbp - 32], 24
	jae	LBB26_6
## %bb.2:                               ##   in Loop: Header=BB26_1 Depth=1
	mov	rax, qword ptr [rbp - 32]
	lea	rcx, [rip + _tgc_primes]
	mov	rax, qword ptr [rcx + 8*rax]
	cmp	rax, qword ptr [rbp - 24]
	jb	LBB26_4
## %bb.3:
	mov	rax, qword ptr [rbp - 32]
	lea	rcx, [rip + _tgc_primes]
	mov	rax, qword ptr [rcx + 8*rax]
	mov	qword ptr [rbp - 8], rax
	jmp	LBB26_11
LBB26_4:                                ##   in Loop: Header=BB26_1 Depth=1
	jmp	LBB26_5
LBB26_5:                                ##   in Loop: Header=BB26_1 Depth=1
	mov	rax, qword ptr [rbp - 32]
	add	rax, 1
	mov	qword ptr [rbp - 32], rax
	jmp	LBB26_1
LBB26_6:
	mov	rax, qword ptr [rip + _tgc_primes+184]
	mov	qword ptr [rbp - 40], rax
	mov	qword ptr [rbp - 32], 0
LBB26_7:                                ## =>This Inner Loop Header: Depth=1
	mov	rax, qword ptr [rbp - 40]
	imul	rax, qword ptr [rbp - 32]
	cmp	rax, qword ptr [rbp - 24]
	jb	LBB26_9
## %bb.8:
	mov	rax, qword ptr [rbp - 40]
	imul	rax, qword ptr [rbp - 32]
	mov	qword ptr [rbp - 8], rax
	jmp	LBB26_11
LBB26_9:                                ##   in Loop: Header=BB26_7 Depth=1
	jmp	LBB26_10
LBB26_10:                               ##   in Loop: Header=BB26_7 Depth=1
	mov	rax, qword ptr [rbp - 32]
	add	rax, 1
	mov	qword ptr [rbp - 32], rax
	jmp	LBB26_7
LBB26_11:
	mov	rax, qword ptr [rbp - 8]
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
	sub	rsp, 48
	mov	qword ptr [rbp - 16], rdi
	mov	qword ptr [rbp - 24], rsi
	mov	rax, qword ptr [rbp - 16]
	mov	rax, qword ptr [rax + 32]
	mov	qword ptr [rbp - 40], rax
	mov	rax, qword ptr [rbp - 16]
	mov	rax, qword ptr [rax + 72]
	mov	qword ptr [rbp - 48], rax
	mov	rax, qword ptr [rbp - 24]
	mov	rcx, qword ptr [rbp - 16]
	mov	qword ptr [rcx + 72], rax
	mov	rax, qword ptr [rbp - 16]
	mov	rdi, qword ptr [rax + 72]
	mov	esi, 40
	call	_calloc
	mov	rcx, qword ptr [rbp - 16]
	mov	qword ptr [rcx + 32], rax
	mov	rax, qword ptr [rbp - 16]
	cmp	qword ptr [rax + 32], 0
	jne	LBB27_2
## %bb.1:
	mov	rax, qword ptr [rbp - 48]
	mov	rcx, qword ptr [rbp - 16]
	mov	qword ptr [rcx + 72], rax
	mov	rax, qword ptr [rbp - 40]
	mov	rcx, qword ptr [rbp - 16]
	mov	qword ptr [rcx + 32], rax
	mov	dword ptr [rbp - 4], 0
	jmp	LBB27_9
LBB27_2:
	mov	qword ptr [rbp - 32], 0
LBB27_3:                                ## =>This Inner Loop Header: Depth=1
	mov	rax, qword ptr [rbp - 32]
	cmp	rax, qword ptr [rbp - 48]
	jae	LBB27_8
## %bb.4:                               ##   in Loop: Header=BB27_3 Depth=1
	mov	rax, qword ptr [rbp - 40]
	imul	rcx, qword ptr [rbp - 32], 40
	add	rax, rcx
	cmp	qword ptr [rax + 24], 0
	je	LBB27_6
## %bb.5:                               ##   in Loop: Header=BB27_3 Depth=1
	mov	rdi, qword ptr [rbp - 16]
	mov	rax, qword ptr [rbp - 40]
	imul	rcx, qword ptr [rbp - 32], 40
	add	rax, rcx
	mov	rsi, qword ptr [rax]
	mov	rax, qword ptr [rbp - 40]
	imul	rcx, qword ptr [rbp - 32], 40
	add	rax, rcx
	mov	rdx, qword ptr [rax + 16]
	mov	rax, qword ptr [rbp - 40]
	imul	rcx, qword ptr [rbp - 32], 40
	add	rax, rcx
	mov	ecx, dword ptr [rax + 8]
	mov	rax, qword ptr [rbp - 40]
	imul	r8, qword ptr [rbp - 32], 40
	add	rax, r8
	mov	r8, qword ptr [rax + 32]
	call	_tgc_add_ptr
LBB27_6:                                ##   in Loop: Header=BB27_3 Depth=1
	jmp	LBB27_7
LBB27_7:                                ##   in Loop: Header=BB27_3 Depth=1
	mov	rax, qword ptr [rbp - 32]
	add	rax, 1
	mov	qword ptr [rbp - 32], rax
	jmp	LBB27_3
LBB27_8:
	mov	rax, qword ptr [rbp - 40]
	mov	rdi, rax
	call	_free
	mov	dword ptr [rbp - 4], 1
LBB27_9:
	mov	eax, dword ptr [rbp - 4]
	add	rsp, 48
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
	sub	rsp, 192
	mov	qword ptr [rbp - 8], rdi
	mov	qword ptr [rbp - 16], rsi
	mov	qword ptr [rbp - 24], rdx
	mov	dword ptr [rbp - 28], ecx
	mov	qword ptr [rbp - 40], r8
	mov	rdi, qword ptr [rbp - 16]
	call	_tgc_hash
	mov	rdx, qword ptr [rbp - 8]
	xor	ecx, ecx
	mov	qword ptr [rbp - 160], rdx ## 8-byte Spill
	mov	edx, ecx
	mov	rsi, qword ptr [rbp - 160] ## 8-byte Reload
	div	qword ptr [rsi + 72]
	mov	qword ptr [rbp - 144], rdx
	mov	qword ptr [rbp - 152], 0
	mov	rdx, qword ptr [rbp - 16]
	mov	qword ptr [rbp - 80], rdx
	mov	ecx, dword ptr [rbp - 28]
	mov	dword ptr [rbp - 72], ecx
	mov	rdx, qword ptr [rbp - 24]
	mov	qword ptr [rbp - 64], rdx
	mov	rdx, qword ptr [rbp - 144]
	add	rdx, 1
	mov	qword ptr [rbp - 56], rdx
	mov	rdx, qword ptr [rbp - 40]
	mov	qword ptr [rbp - 48], rdx
LBB28_1:                                ## =>This Inner Loop Header: Depth=1
	mov	rax, qword ptr [rbp - 8]
	mov	rax, qword ptr [rax + 32]
	imul	rcx, qword ptr [rbp - 144], 40
	add	rax, rcx
	mov	rax, qword ptr [rax + 24]
	mov	qword ptr [rbp - 128], rax
	cmp	qword ptr [rbp - 128], 0
	jne	LBB28_3
## %bb.2:
	mov	rax, qword ptr [rbp - 8]
	mov	rax, qword ptr [rax + 32]
	imul	rcx, qword ptr [rbp - 144], 40
	add	rax, rcx
	lea	rcx, [rbp - 80]
	mov	rdi, rax
	mov	rsi, rcx
	mov	edx, 40
	call	_memcpy
	jmp	LBB28_8
LBB28_3:                                ##   in Loop: Header=BB28_1 Depth=1
	mov	rax, qword ptr [rbp - 8]
	mov	rax, qword ptr [rax + 32]
	imul	rcx, qword ptr [rbp - 144], 40
	add	rax, rcx
	mov	rax, qword ptr [rax]
	cmp	rax, qword ptr [rbp - 80]
	jne	LBB28_5
## %bb.4:
	jmp	LBB28_8
LBB28_5:                                ##   in Loop: Header=BB28_1 Depth=1
	mov	rdi, qword ptr [rbp - 8]
	mov	rsi, qword ptr [rbp - 144]
	mov	rdx, qword ptr [rbp - 128]
	call	_tgc_probe
	mov	qword ptr [rbp - 136], rax
	mov	rax, qword ptr [rbp - 152]
	cmp	rax, qword ptr [rbp - 136]
	jb	LBB28_7
## %bb.6:                               ##   in Loop: Header=BB28_1 Depth=1
	mov	rax, qword ptr [rbp - 8]
	mov	rax, qword ptr [rax + 32]
	imul	rcx, qword ptr [rbp - 144], 40
	add	rax, rcx
	lea	rcx, [rbp - 120]
	mov	rdx, rcx
	mov	rdi, rdx
	mov	rsi, rax
	mov	eax, 40
	mov	rdx, rax
	mov	qword ptr [rbp - 168], rcx ## 8-byte Spill
	mov	qword ptr [rbp - 176], rax ## 8-byte Spill
	call	_memcpy
	mov	rax, qword ptr [rbp - 8]
	mov	rax, qword ptr [rax + 32]
	imul	rcx, qword ptr [rbp - 144], 40
	add	rax, rcx
	lea	rcx, [rbp - 80]
	mov	rdx, rcx
	mov	rdi, rax
	mov	rsi, rdx
	mov	rdx, qword ptr [rbp - 176] ## 8-byte Reload
	mov	qword ptr [rbp - 184], rcx ## 8-byte Spill
	call	_memcpy
	mov	rax, qword ptr [rbp - 184] ## 8-byte Reload
	mov	rcx, qword ptr [rbp - 168] ## 8-byte Reload
	mov	rdi, rax
	mov	rsi, rcx
	mov	rdx, qword ptr [rbp - 176] ## 8-byte Reload
	call	_memcpy
	mov	rax, qword ptr [rbp - 136]
	mov	qword ptr [rbp - 152], rax
LBB28_7:                                ##   in Loop: Header=BB28_1 Depth=1
	mov	rax, qword ptr [rbp - 144]
	add	rax, 1
	mov	rcx, qword ptr [rbp - 8]
	xor	edx, edx
                                        ## kill: def $rdx killed $edx
	div	qword ptr [rcx + 72]
	mov	qword ptr [rbp - 144], rdx
	mov	rcx, qword ptr [rbp - 152]
	add	rcx, 1
	mov	qword ptr [rbp - 152], rcx
	jmp	LBB28_1
LBB28_8:
	add	rsp, 192
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
	mov	qword ptr [rbp - 8], rdi
	mov	rax, qword ptr [rbp - 8]
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
	sub	rsp, 48
	mov	qword ptr [rbp - 8], rdi
	mov	rax, qword ptr [rbp - 8]
	mov	rax, qword ptr [rax]
	mov	qword ptr [rbp - 24], rax
	lea	rax, [rbp - 16]
	mov	qword ptr [rbp - 32], rax
	mov	rax, qword ptr [rbp - 24]
	cmp	rax, qword ptr [rbp - 32]
	jne	LBB30_2
## %bb.1:
	jmp	LBB30_14
LBB30_2:
	mov	rax, qword ptr [rbp - 24]
	cmp	rax, qword ptr [rbp - 32]
	jae	LBB30_8
## %bb.3:
	mov	rax, qword ptr [rbp - 32]
	mov	qword ptr [rbp - 40], rax
LBB30_4:                                ## =>This Inner Loop Header: Depth=1
	mov	rax, qword ptr [rbp - 40]
	cmp	rax, qword ptr [rbp - 24]
	jb	LBB30_7
## %bb.5:                               ##   in Loop: Header=BB30_4 Depth=1
	mov	rdi, qword ptr [rbp - 8]
	mov	rax, qword ptr [rbp - 40]
	mov	rsi, qword ptr [rax]
	call	_tgc_mark_ptr
## %bb.6:                               ##   in Loop: Header=BB30_4 Depth=1
	mov	rax, qword ptr [rbp - 40]
	add	rax, -8
	mov	qword ptr [rbp - 40], rax
	jmp	LBB30_4
LBB30_7:
	jmp	LBB30_8
LBB30_8:
	mov	rax, qword ptr [rbp - 24]
	cmp	rax, qword ptr [rbp - 32]
	jbe	LBB30_14
## %bb.9:
	mov	rax, qword ptr [rbp - 32]
	mov	qword ptr [rbp - 40], rax
LBB30_10:                               ## =>This Inner Loop Header: Depth=1
	mov	rax, qword ptr [rbp - 40]
	cmp	rax, qword ptr [rbp - 24]
	ja	LBB30_13
## %bb.11:                              ##   in Loop: Header=BB30_10 Depth=1
	mov	rdi, qword ptr [rbp - 8]
	mov	rax, qword ptr [rbp - 40]
	mov	rsi, qword ptr [rax]
	call	_tgc_mark_ptr
## %bb.12:                              ##   in Loop: Header=BB30_10 Depth=1
	mov	rax, qword ptr [rbp - 40]
	add	rax, 8
	mov	qword ptr [rbp - 40], rax
	jmp	LBB30_10
LBB30_13:
	jmp	LBB30_14
LBB30_14:
	add	rsp, 48
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
	sub	rsp, 64
	mov	qword ptr [rbp - 8], rdi
	mov	qword ptr [rbp - 16], rsi
	mov	rax, qword ptr [rbp - 16]
	mov	rcx, qword ptr [rbp - 8]
	cmp	rax, qword ptr [rcx + 16]
	jb	LBB31_2
## %bb.1:
	mov	rax, qword ptr [rbp - 16]
	mov	rcx, qword ptr [rbp - 8]
	cmp	rax, qword ptr [rcx + 24]
	jbe	LBB31_3
LBB31_2:
	jmp	LBB31_18
LBB31_3:
	mov	rdi, qword ptr [rbp - 16]
	call	_tgc_hash
	mov	rcx, qword ptr [rbp - 8]
	xor	edx, edx
                                        ## kill: def $rdx killed $edx
	div	qword ptr [rcx + 72]
	mov	qword ptr [rbp - 24], rdx
	mov	qword ptr [rbp - 32], 0
LBB31_4:                                ## =>This Inner Loop Header: Depth=1
	mov	rax, qword ptr [rbp - 8]
	mov	rax, qword ptr [rax + 32]
	imul	rcx, qword ptr [rbp - 24], 40
	add	rax, rcx
	mov	rax, qword ptr [rax + 24]
	mov	qword ptr [rbp - 40], rax
	cmp	qword ptr [rbp - 40], 0
	je	LBB31_6
## %bb.5:                               ##   in Loop: Header=BB31_4 Depth=1
	mov	rax, qword ptr [rbp - 32]
	mov	rdi, qword ptr [rbp - 8]
	mov	rsi, qword ptr [rbp - 24]
	mov	rdx, qword ptr [rbp - 40]
	mov	qword ptr [rbp - 56], rax ## 8-byte Spill
	call	_tgc_probe
	mov	rcx, qword ptr [rbp - 56] ## 8-byte Reload
	cmp	rcx, rax
	jbe	LBB31_7
LBB31_6:
	jmp	LBB31_18
LBB31_7:                                ##   in Loop: Header=BB31_4 Depth=1
	mov	rax, qword ptr [rbp - 16]
	mov	rcx, qword ptr [rbp - 8]
	mov	rcx, qword ptr [rcx + 32]
	imul	rdx, qword ptr [rbp - 24], 40
	add	rcx, rdx
	cmp	rax, qword ptr [rcx]
	jne	LBB31_17
## %bb.8:
	mov	rax, qword ptr [rbp - 8]
	mov	rax, qword ptr [rax + 32]
	imul	rcx, qword ptr [rbp - 24], 40
	add	rax, rcx
	mov	edx, dword ptr [rax + 8]
	and	edx, 1
	cmp	edx, 0
	je	LBB31_10
## %bb.9:
	jmp	LBB31_18
LBB31_10:
	mov	rax, qword ptr [rbp - 8]
	mov	rax, qword ptr [rax + 32]
	imul	rcx, qword ptr [rbp - 24], 40
	add	rax, rcx
	mov	edx, dword ptr [rax + 8]
	or	edx, 1
	mov	dword ptr [rax + 8], edx
	mov	rax, qword ptr [rbp - 8]
	mov	rax, qword ptr [rax + 32]
	imul	rcx, qword ptr [rbp - 24], 40
	add	rax, rcx
	mov	edx, dword ptr [rax + 8]
	and	edx, 4
	cmp	edx, 0
	je	LBB31_12
## %bb.11:
	jmp	LBB31_18
LBB31_12:
	mov	qword ptr [rbp - 48], 0
LBB31_13:                               ## =>This Inner Loop Header: Depth=1
	mov	rax, qword ptr [rbp - 48]
	mov	rcx, qword ptr [rbp - 8]
	mov	rcx, qword ptr [rcx + 32]
	imul	rdx, qword ptr [rbp - 24], 40
	add	rcx, rdx
	mov	rcx, qword ptr [rcx + 16]
	shr	rcx, 3
	cmp	rax, rcx
	jae	LBB31_16
## %bb.14:                              ##   in Loop: Header=BB31_13 Depth=1
	mov	rdi, qword ptr [rbp - 8]
	mov	rax, qword ptr [rbp - 8]
	mov	rax, qword ptr [rax + 32]
	imul	rcx, qword ptr [rbp - 24], 40
	add	rax, rcx
	mov	rax, qword ptr [rax]
	mov	rcx, qword ptr [rbp - 48]
	mov	rsi, qword ptr [rax + 8*rcx]
	call	_tgc_mark_ptr
## %bb.15:                              ##   in Loop: Header=BB31_13 Depth=1
	mov	rax, qword ptr [rbp - 48]
	add	rax, 1
	mov	qword ptr [rbp - 48], rax
	jmp	LBB31_13
LBB31_16:
	jmp	LBB31_18
LBB31_17:                               ##   in Loop: Header=BB31_4 Depth=1
	mov	rax, qword ptr [rbp - 24]
	add	rax, 1
	mov	rcx, qword ptr [rbp - 8]
	xor	edx, edx
                                        ## kill: def $rdx killed $edx
	div	qword ptr [rcx + 72]
	mov	qword ptr [rbp - 24], rdx
	mov	rcx, qword ptr [rbp - 32]
	add	rcx, 1
	mov	qword ptr [rbp - 32], rcx
	jmp	LBB31_4
LBB31_18:
	add	rsp, 64
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
	sub	rsp, 80
	mov	qword ptr [rbp - 8], rdi
	mov	qword ptr [rbp - 16], rsi
	mov	rax, qword ptr [rbp - 8]
	cmp	qword ptr [rax + 64], 0
	jne	LBB32_2
## %bb.1:
	jmp	LBB32_21
LBB32_2:
	mov	qword ptr [rbp - 24], 0
LBB32_3:                                ## =>This Inner Loop Header: Depth=1
	mov	rax, qword ptr [rbp - 24]
	mov	rcx, qword ptr [rbp - 8]
	cmp	rax, qword ptr [rcx + 88]
	jae	LBB32_8
## %bb.4:                               ##   in Loop: Header=BB32_3 Depth=1
	mov	rax, qword ptr [rbp - 8]
	mov	rax, qword ptr [rax + 40]
	imul	rcx, qword ptr [rbp - 24], 40
	add	rax, rcx
	mov	rax, qword ptr [rax]
	cmp	rax, qword ptr [rbp - 16]
	jne	LBB32_6
## %bb.5:                               ##   in Loop: Header=BB32_3 Depth=1
	mov	rax, qword ptr [rbp - 8]
	mov	rax, qword ptr [rax + 40]
	imul	rcx, qword ptr [rbp - 24], 40
	add	rax, rcx
	mov	qword ptr [rax], 0
LBB32_6:                                ##   in Loop: Header=BB32_3 Depth=1
	jmp	LBB32_7
LBB32_7:                                ##   in Loop: Header=BB32_3 Depth=1
	mov	rax, qword ptr [rbp - 24]
	add	rax, 1
	mov	qword ptr [rbp - 24], rax
	jmp	LBB32_3
LBB32_8:
	mov	rdi, qword ptr [rbp - 16]
	call	_tgc_hash
	mov	rcx, qword ptr [rbp - 8]
	xor	edx, edx
                                        ## kill: def $rdx killed $edx
	div	qword ptr [rcx + 72]
	mov	qword ptr [rbp - 24], rdx
	mov	qword ptr [rbp - 32], 0
LBB32_9:                                ## =>This Inner Loop Header: Depth=1
	mov	rax, qword ptr [rbp - 8]
	mov	rax, qword ptr [rax + 32]
	imul	rcx, qword ptr [rbp - 24], 40
	add	rax, rcx
	mov	rax, qword ptr [rax + 24]
	mov	qword ptr [rbp - 40], rax
	cmp	qword ptr [rbp - 40], 0
	je	LBB32_11
## %bb.10:                              ##   in Loop: Header=BB32_9 Depth=1
	mov	rax, qword ptr [rbp - 32]
	mov	rdi, qword ptr [rbp - 8]
	mov	rsi, qword ptr [rbp - 24]
	mov	rdx, qword ptr [rbp - 40]
	mov	qword ptr [rbp - 64], rax ## 8-byte Spill
	call	_tgc_probe
	mov	rcx, qword ptr [rbp - 64] ## 8-byte Reload
	cmp	rcx, rax
	jbe	LBB32_12
LBB32_11:
	jmp	LBB32_21
LBB32_12:                               ##   in Loop: Header=BB32_9 Depth=1
	mov	rax, qword ptr [rbp - 8]
	mov	rax, qword ptr [rax + 32]
	imul	rcx, qword ptr [rbp - 24], 40
	add	rax, rcx
	mov	rax, qword ptr [rax]
	cmp	rax, qword ptr [rbp - 16]
	jne	LBB32_20
## %bb.13:
	xor	esi, esi
	mov	rax, qword ptr [rbp - 8]
	mov	rax, qword ptr [rax + 32]
	imul	rcx, qword ptr [rbp - 24], 40
	add	rax, rcx
	mov	rdi, rax
	mov	edx, 40
	mov	rcx, -1
	call	___memset_chk
	mov	rcx, qword ptr [rbp - 24]
	mov	qword ptr [rbp - 32], rcx
LBB32_14:                               ## =>This Inner Loop Header: Depth=1
	mov	rax, qword ptr [rbp - 32]
	add	rax, 1
	mov	rcx, qword ptr [rbp - 8]
	xor	edx, edx
                                        ## kill: def $rdx killed $edx
	div	qword ptr [rcx + 72]
	mov	qword ptr [rbp - 48], rdx
	mov	rcx, qword ptr [rbp - 8]
	mov	rcx, qword ptr [rcx + 32]
	imul	rdx, qword ptr [rbp - 48], 40
	add	rcx, rdx
	mov	rcx, qword ptr [rcx + 24]
	mov	qword ptr [rbp - 56], rcx
	cmp	qword ptr [rbp - 56], 0
	je	LBB32_17
## %bb.15:                              ##   in Loop: Header=BB32_14 Depth=1
	mov	rdi, qword ptr [rbp - 8]
	mov	rsi, qword ptr [rbp - 48]
	mov	rdx, qword ptr [rbp - 56]
	call	_tgc_probe
	cmp	rax, 0
	jbe	LBB32_17
## %bb.16:                              ##   in Loop: Header=BB32_14 Depth=1
	mov	rax, qword ptr [rbp - 8]
	mov	rax, qword ptr [rax + 32]
	imul	rcx, qword ptr [rbp - 32], 40
	add	rax, rcx
	mov	rcx, qword ptr [rbp - 8]
	mov	rcx, qword ptr [rcx + 32]
	imul	rdx, qword ptr [rbp - 48], 40
	add	rcx, rdx
	mov	rdi, rax
	mov	rsi, rcx
	mov	edx, 40
	mov	rcx, -1
	call	___memcpy_chk
	xor	esi, esi
	mov	rcx, qword ptr [rbp - 8]
	mov	rcx, qword ptr [rcx + 32]
	imul	rdx, qword ptr [rbp - 48], 40
	add	rcx, rdx
	mov	rdi, rcx
	mov	edx, 40
	mov	rcx, -1
	mov	qword ptr [rbp - 72], rax ## 8-byte Spill
	call	___memset_chk
	mov	rcx, qword ptr [rbp - 48]
	mov	qword ptr [rbp - 32], rcx
	jmp	LBB32_18
LBB32_17:
	jmp	LBB32_19
LBB32_18:                               ##   in Loop: Header=BB32_14 Depth=1
	jmp	LBB32_14
LBB32_19:
	mov	rax, qword ptr [rbp - 8]
	mov	rcx, qword ptr [rax + 64]
	add	rcx, -1
	mov	qword ptr [rax + 64], rcx
	jmp	LBB32_21
LBB32_20:                               ##   in Loop: Header=BB32_9 Depth=1
	mov	rax, qword ptr [rbp - 24]
	add	rax, 1
	mov	rcx, qword ptr [rbp - 8]
	xor	edx, edx
                                        ## kill: def $rdx killed $edx
	div	qword ptr [rcx + 72]
	mov	qword ptr [rbp - 24], rdx
	mov	rcx, qword ptr [rbp - 32]
	add	rcx, 1
	mov	qword ptr [rbp - 32], rcx
	jmp	LBB32_9
LBB32_21:
	add	rsp, 80
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
	sub	rsp, 32
	mov	qword ptr [rbp - 8], rdi
	mov	rdi, qword ptr [rbp - 8]
	mov	rax, qword ptr [rbp - 8]
	mov	rsi, qword ptr [rax + 64]
	call	_tgc_ideal_size
	mov	qword ptr [rbp - 16], rax
	mov	rax, qword ptr [rbp - 8]
	mov	rax, qword ptr [rax + 72]
	mov	qword ptr [rbp - 24], rax
	mov	rax, qword ptr [rbp - 16]
	cmp	rax, qword ptr [rbp - 24]
	jbe	LBB33_2
## %bb.1:
	mov	rdi, qword ptr [rbp - 8]
	mov	rsi, qword ptr [rbp - 16]
	call	_tgc_rehash
	mov	dword ptr [rbp - 28], eax ## 4-byte Spill
	jmp	LBB33_3
LBB33_2:
	mov	eax, 1
	mov	dword ptr [rbp - 28], eax ## 4-byte Spill
	jmp	LBB33_3
LBB33_3:
	mov	eax, dword ptr [rbp - 28] ## 4-byte Reload
	add	rsp, 32
	pop	rbp
	ret
	.cfi_endproc
                                        ## -- End function
	.section	__TEXT,__literal8,8byte_literals
	.p2align	2               ## @__const.begin_gc.stack_var
L___const.begin_gc.stack_var:
	.long	1                       ## 0x1
	.long	2                       ## 0x2

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
