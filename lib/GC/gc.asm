	.section	__TEXT,__text,regular,pure_instructions
	.build_version macos, 10, 15	sdk_version 10, 15, 6
	.intel_syntax noprefix
	.globl	_gc_init                ## -- Begin function gc_init
	.p2align	4, 0x90
_gc_init:                               ## @gc_init
	.cfi_startproc
## %bb.0:
	push	rbp
	.cfi_def_cfa_offset 16
	.cfi_offset rbp, -16
	mov	rbp, rsp
	.cfi_def_cfa_register rbp
	sub	rsp, 608
	mov	qword ptr [rbp - 8], rdi
	mov	qword ptr [rbp - 16], rsi
	cmp	qword ptr [rip + ___gc_object+536], 0
	je	LBB0_2
## %bb.1:
	mov	rax, qword ptr [rip + ___gc_object+536]
	add	rax, 1
	mov	qword ptr [rip + ___gc_object+536], rax
	jmp	LBB0_3
LBB0_2:
	lea	rax, [rip + ___gc_object]
	xor	esi, esi
	lea	rcx, [rbp - 584]
	mov	rdx, rcx
	mov	rdi, rdx
	mov	edx, 568
	mov	qword ptr [rbp - 592], rdx ## 8-byte Spill
	mov	qword ptr [rbp - 600], rax ## 8-byte Spill
	mov	qword ptr [rbp - 608], rcx ## 8-byte Spill
	call	_memset
	mov	rax, qword ptr [rbp - 8]
	mov	qword ptr [rbp - 584], rax
	mov	qword ptr [rbp - 64], 0
	mov	rax, qword ptr [rbp - 16]
	mov	qword ptr [rbp - 56], rax
	mov	qword ptr [rbp - 48], 1
	mov	qword ptr [rbp - 40], -1
	mov	qword ptr [rbp - 32], 0
	mov	rax, qword ptr [rbp - 608] ## 8-byte Reload
	mov	rdi, qword ptr [rbp - 600] ## 8-byte Reload
	mov	rsi, rax
	mov	rdx, qword ptr [rbp - 592] ## 8-byte Reload
	call	_memcpy
LBB0_3:
	add	rsp, 608
	pop	rbp
	ret
	.cfi_endproc
                                        ## -- End function
	.globl	_gc_mark                ## -- Begin function gc_mark
	.p2align	4, 0x90
_gc_mark:                               ## @gc_mark
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
	mov	rax, qword ptr [rbp - 8]
	cmp	rax, qword ptr [rbp - 16]
	jbe	LBB1_2
## %bb.1:
	lea	rdi, [rbp - 8]
	lea	rsi, [rbp - 16]
	call	_swap_ptr
LBB1_2:
	jmp	LBB1_3
LBB1_3:                                 ## =>This Inner Loop Header: Depth=1
	mov	rax, qword ptr [rbp - 8]
	cmp	rax, qword ptr [rbp - 16]
	jae	LBB1_8
## %bb.4:                               ##   in Loop: Header=BB1_3 Depth=1
	mov	rax, qword ptr [rbp - 8]
	mov	rdi, qword ptr [rax]
	call	_gc_ptr_index
	mov	qword ptr [rbp - 24], rax
	cmp	qword ptr [rbp - 24], 0
	je	LBB1_7
## %bb.5:                               ##   in Loop: Header=BB1_3 Depth=1
	mov	rax, qword ptr [rbp - 24]
	mov	cl, byte ptr [rax + 24]
	and	cl, 1
	movzx	edx, cl
	cmp	edx, 1
	je	LBB1_7
## %bb.6:                               ##   in Loop: Header=BB1_3 Depth=1
	mov	rax, qword ptr [rbp - 24]
	mov	byte ptr [rax + 24], 1
	mov	rax, qword ptr [rbp - 24]
	mov	rdi, qword ptr [rax + 8]
	mov	rax, qword ptr [rbp - 24]
	mov	rax, qword ptr [rax + 8]
	mov	rcx, qword ptr [rbp - 24]
	add	rax, qword ptr [rcx + 16]
	mov	rsi, rax
	call	_gc_mark
LBB1_7:                                 ##   in Loop: Header=BB1_3 Depth=1
	mov	rax, qword ptr [rbp - 8]
	add	rax, 1
	mov	qword ptr [rbp - 8], rax
	jmp	LBB1_3
LBB1_8:
	add	rsp, 32
	pop	rbp
	ret
	.cfi_endproc
                                        ## -- End function
	.p2align	4, 0x90         ## -- Begin function swap_ptr
_swap_ptr:                              ## @swap_ptr
	.cfi_startproc
## %bb.0:
	push	rbp
	.cfi_def_cfa_offset 16
	.cfi_offset rbp, -16
	mov	rbp, rsp
	.cfi_def_cfa_register rbp
	mov	qword ptr [rbp - 8], rdi
	mov	qword ptr [rbp - 16], rsi
	mov	rax, qword ptr [rbp - 8]
	mov	rax, qword ptr [rax]
	mov	qword ptr [rbp - 24], rax
	mov	rax, qword ptr [rbp - 16]
	mov	rax, qword ptr [rax]
	mov	rcx, qword ptr [rbp - 8]
	mov	qword ptr [rcx], rax
	mov	rax, qword ptr [rbp - 24]
	mov	rcx, qword ptr [rbp - 16]
	mov	qword ptr [rcx], rax
	pop	rbp
	ret
	.cfi_endproc
                                        ## -- End function
	.globl	_gc_ptr_index           ## -- Begin function gc_ptr_index
	.p2align	4, 0x90
_gc_ptr_index:                          ## @gc_ptr_index
	.cfi_startproc
## %bb.0:
	push	rbp
	.cfi_def_cfa_offset 16
	.cfi_offset rbp, -16
	mov	rbp, rsp
	.cfi_def_cfa_register rbp
	sub	rsp, 48
	mov	qword ptr [rbp - 16], rdi
	mov	rax, qword ptr [rbp - 16]
	cmp	rax, qword ptr [rip + ___gc_object+552]
	ja	LBB3_2
## %bb.1:
	mov	rax, qword ptr [rbp - 16]
	cmp	rax, qword ptr [rip + ___gc_object+544]
	jae	LBB3_3
LBB3_2:
	mov	qword ptr [rbp - 8], 0
	jmp	LBB3_17
LBB3_3:
	mov	rax, qword ptr [rbp - 16]
	shr	rax, 3
	and	rax, 63
                                        ## kill: def $eax killed $eax killed $rax
	mov	dword ptr [rbp - 20], eax
	mov	rdi, qword ptr [rbp - 16]
	movsxd	rcx, dword ptr [rbp - 20]
	lea	rdx, [rip + ___gc_object]
	mov	rsi, qword ptr [rdx + 8*rcx + 8]
	call	_list_search
	mov	qword ptr [rbp - 32], rax
	cmp	rax, 0
	je	LBB3_5
## %bb.4:
	mov	rax, qword ptr [rbp - 32]
	mov	qword ptr [rbp - 8], rax
	jmp	LBB3_17
LBB3_5:
	mov	dword ptr [rbp - 36], 0
LBB3_6:                                 ## =>This Inner Loop Header: Depth=1
	mov	eax, dword ptr [rbp - 36]
	add	eax, 1
	mov	dword ptr [rbp - 36], eax
	add	eax, dword ptr [rbp - 20]
	cmp	eax, 64
	mov	cl, 1
	mov	byte ptr [rbp - 37], cl ## 1-byte Spill
	jl	LBB3_8
## %bb.7:                               ##   in Loop: Header=BB3_6 Depth=1
	mov	eax, dword ptr [rbp - 20]
	cmp	eax, dword ptr [rbp - 36]
	setg	cl
	mov	byte ptr [rbp - 37], cl ## 1-byte Spill
LBB3_8:                                 ##   in Loop: Header=BB3_6 Depth=1
	mov	al, byte ptr [rbp - 37] ## 1-byte Reload
	test	al, 1
	jne	LBB3_9
	jmp	LBB3_16
LBB3_9:                                 ##   in Loop: Header=BB3_6 Depth=1
	mov	eax, dword ptr [rbp - 20]
	cmp	eax, dword ptr [rbp - 36]
	jle	LBB3_12
## %bb.10:                              ##   in Loop: Header=BB3_6 Depth=1
	mov	rdi, qword ptr [rbp - 16]
	mov	eax, dword ptr [rbp - 20]
	sub	eax, dword ptr [rbp - 36]
	movsxd	rcx, eax
	lea	rdx, [rip + ___gc_object]
	mov	rsi, qword ptr [rdx + 8*rcx + 8]
	call	_list_search
	mov	qword ptr [rbp - 32], rax
	cmp	rax, 0
	je	LBB3_12
## %bb.11:
	mov	rax, qword ptr [rbp - 32]
	mov	qword ptr [rbp - 8], rax
	jmp	LBB3_17
LBB3_12:                                ##   in Loop: Header=BB3_6 Depth=1
	mov	eax, dword ptr [rbp - 20]
	add	eax, dword ptr [rbp - 36]
	cmp	eax, 64
	jge	LBB3_15
## %bb.13:                              ##   in Loop: Header=BB3_6 Depth=1
	mov	rdi, qword ptr [rbp - 16]
	mov	eax, dword ptr [rbp - 20]
	add	eax, dword ptr [rbp - 36]
	movsxd	rcx, eax
	lea	rdx, [rip + ___gc_object]
	mov	rsi, qword ptr [rdx + 8*rcx + 8]
	call	_list_search
	mov	qword ptr [rbp - 32], rax
	cmp	rax, 0
	je	LBB3_15
## %bb.14:
	mov	rax, qword ptr [rbp - 32]
	mov	qword ptr [rbp - 8], rax
	jmp	LBB3_17
LBB3_15:                                ##   in Loop: Header=BB3_6 Depth=1
	jmp	LBB3_6
LBB3_16:
	mov	qword ptr [rbp - 8], 0
LBB3_17:
	mov	rax, qword ptr [rbp - 8]
	add	rsp, 48
	pop	rbp
	ret
	.cfi_endproc
                                        ## -- End function
	.globl	_gc_sweep               ## -- Begin function gc_sweep
	.p2align	4, 0x90
_gc_sweep:                              ## @gc_sweep
	.cfi_startproc
## %bb.0:
	push	rbp
	.cfi_def_cfa_offset 16
	.cfi_offset rbp, -16
	mov	rbp, rsp
	.cfi_def_cfa_register rbp
	sub	rsp, 32
	mov	dword ptr [rbp - 4], 0
LBB4_1:                                 ## =>This Loop Header: Depth=1
                                        ##     Child Loop BB4_3 Depth 2
	mov	eax, dword ptr [rbp - 4]
	add	eax, 1
	mov	dword ptr [rbp - 4], eax
	cmp	eax, 64
	jge	LBB4_9
## %bb.2:                               ##   in Loop: Header=BB4_1 Depth=1
	movsxd	rax, dword ptr [rbp - 4]
	lea	rcx, [rip + ___gc_object]
	mov	rax, qword ptr [rcx + 8*rax + 8]
	mov	qword ptr [rbp - 16], rax
	mov	dword ptr [rbp - 20], 0
LBB4_3:                                 ##   Parent Loop BB4_1 Depth=1
                                        ## =>  This Inner Loop Header: Depth=2
	cmp	qword ptr [rbp - 16], 0
	je	LBB4_8
## %bb.4:                               ##   in Loop: Header=BB4_3 Depth=2
	mov	rax, qword ptr [rbp - 16]
	test	byte ptr [rax + 24], 1
	jne	LBB4_6
## %bb.5:                               ##   in Loop: Header=BB4_3 Depth=2
	mov	rdi, qword ptr [rbp - 16]
	call	_gc_mfree
	lea	rax, [rip + ___gc_object]
	add	rax, 8
	mov	rcx, qword ptr [rbp - 16]
	mov	rcx, qword ptr [rcx]
	mov	qword ptr [rbp - 16], rcx
	movsxd	rcx, dword ptr [rbp - 4]
	shl	rcx, 3
	add	rax, rcx
	movsxd	rsi, dword ptr [rbp - 20]
	mov	rdi, rax
	call	_gc_list_del
	jmp	LBB4_7
LBB4_6:                                 ##   in Loop: Header=BB4_3 Depth=2
	mov	rax, qword ptr [rbp - 16]
	mov	byte ptr [rax + 24], 0
	mov	rax, qword ptr [rbp - 16]
	mov	rax, qword ptr [rax]
	mov	qword ptr [rbp - 16], rax
LBB4_7:                                 ##   in Loop: Header=BB4_3 Depth=2
	mov	eax, dword ptr [rbp - 20]
	add	eax, 1
	mov	dword ptr [rbp - 20], eax
	jmp	LBB4_3
LBB4_8:                                 ##   in Loop: Header=BB4_1 Depth=1
	jmp	LBB4_1
LBB4_9:
	add	rsp, 32
	pop	rbp
	ret
	.cfi_endproc
                                        ## -- End function
	.p2align	4, 0x90         ## -- Begin function gc_mfree
_gc_mfree:                              ## @gc_mfree
	.cfi_startproc
## %bb.0:
	push	rbp
	.cfi_def_cfa_offset 16
	.cfi_offset rbp, -16
	mov	rbp, rsp
	.cfi_def_cfa_register rbp
	sub	rsp, 16
	mov	qword ptr [rbp - 8], rdi
	mov	rax, qword ptr [rbp - 8]
	mov	rdi, qword ptr [rax + 8]
	call	_free
	mov	rax, qword ptr [rip + ___gc_object+520]
	add	rax, -1
	mov	qword ptr [rip + ___gc_object+520], rax
	add	rsp, 16
	pop	rbp
	ret
	.cfi_endproc
                                        ## -- End function
	.globl	_gc_list_del            ## -- Begin function gc_list_del
	.p2align	4, 0x90
_gc_list_del:                           ## @gc_list_del
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
	mov	qword ptr [rbp - 32], 0
	mov	rax, qword ptr [rbp - 8]
	mov	rax, qword ptr [rax]
	mov	qword ptr [rbp - 24], rax
	cmp	rax, 0
	jne	LBB6_2
## %bb.1:
	jmp	LBB6_11
LBB6_2:
	mov	qword ptr [rbp - 40], 0
LBB6_3:                                 ## =>This Inner Loop Header: Depth=1
	cmp	qword ptr [rbp - 24], 0
	je	LBB6_11
## %bb.4:                               ##   in Loop: Header=BB6_3 Depth=1
	mov	rax, qword ptr [rbp - 40]
	cmp	rax, qword ptr [rbp - 16]
	jne	LBB6_9
## %bb.5:
	cmp	qword ptr [rbp - 32], 0
	je	LBB6_7
## %bb.6:
	mov	rax, qword ptr [rbp - 24]
	mov	rax, qword ptr [rax]
	mov	rcx, qword ptr [rbp - 32]
	mov	qword ptr [rcx], rax
	jmp	LBB6_8
LBB6_7:
	mov	rax, qword ptr [rbp - 24]
	mov	rax, qword ptr [rax]
	mov	rcx, qword ptr [rbp - 8]
	mov	qword ptr [rcx], rax
LBB6_8:
	mov	rax, qword ptr [rbp - 24]
	mov	rdi, rax
	call	_free
	jmp	LBB6_11
LBB6_9:                                 ##   in Loop: Header=BB6_3 Depth=1
	mov	rax, qword ptr [rbp - 24]
	mov	qword ptr [rbp - 32], rax
	mov	rax, qword ptr [rbp - 24]
	mov	rax, qword ptr [rax]
	mov	qword ptr [rbp - 24], rax
## %bb.10:                              ##   in Loop: Header=BB6_3 Depth=1
	mov	rax, qword ptr [rbp - 40]
	add	rax, 1
	mov	qword ptr [rbp - 40], rax
	jmp	LBB6_3
LBB6_11:
	add	rsp, 48
	pop	rbp
	ret
	.cfi_endproc
                                        ## -- End function
	.globl	_gc_run                 ## -- Begin function gc_run
	.p2align	4, 0x90
_gc_run:                                ## @gc_run
	.cfi_startproc
## %bb.0:
	push	rbp
	.cfi_def_cfa_offset 16
	.cfi_offset rbp, -16
	mov	rbp, rsp
	.cfi_def_cfa_register rbp
	call	_gc_mark_stack
	call	_gc_sweep
	pop	rbp
	ret
	.cfi_endproc
                                        ## -- End function
	.globl	_gc_mark_stack          ## -- Begin function gc_mark_stack
	.p2align	4, 0x90
_gc_mark_stack:                         ## @gc_mark_stack
	.cfi_startproc
## %bb.0:
	push	rbp
	.cfi_def_cfa_offset 16
	.cfi_offset rbp, -16
	mov	rbp, rsp
	.cfi_def_cfa_register rbp
	sub	rsp, 16
	mov	rdi, qword ptr [rip + ___gc_object]
	lea	rsi, [rbp - 1]
	call	_gc_mark
	mov	rax, qword ptr [rip + ___gc_object+560]
	mov	qword ptr [rbp - 16], rax
LBB8_1:                                 ## =>This Inner Loop Header: Depth=1
	cmp	qword ptr [rbp - 16], 0
	je	LBB8_4
## %bb.2:                               ##   in Loop: Header=BB8_1 Depth=1
	mov	rax, qword ptr [rbp - 16]
	mov	rdi, qword ptr [rax + 8]
	mov	rax, qword ptr [rbp - 16]
	mov	rax, qword ptr [rax + 8]
	mov	rcx, qword ptr [rbp - 16]
	add	rax, qword ptr [rcx + 16]
	mov	rsi, rax
	call	_gc_mark
## %bb.3:                               ##   in Loop: Header=BB8_1 Depth=1
	mov	rax, qword ptr [rbp - 16]
	mov	rax, qword ptr [rax]
	mov	qword ptr [rbp - 16], rax
	jmp	LBB8_1
LBB8_4:
	add	rsp, 16
	pop	rbp
	ret
	.cfi_endproc
                                        ## -- End function
	.globl	_gc_destroy             ## -- Begin function gc_destroy
	.p2align	4, 0x90
_gc_destroy:                            ## @gc_destroy
	.cfi_startproc
## %bb.0:
	push	rbp
	.cfi_def_cfa_offset 16
	.cfi_offset rbp, -16
	mov	rbp, rsp
	.cfi_def_cfa_register rbp
	sub	rsp, 32
	mov	rax, qword ptr [rip + ___gc_object+536]
	add	rax, -1
	mov	qword ptr [rip + ___gc_object+536], rax
	cmp	qword ptr [rip + ___gc_object+536], 0
	ja	LBB9_8
## %bb.1:
	mov	qword ptr [rip + ___gc_object+536], 0
	mov	dword ptr [rbp - 4], -1
LBB9_2:                                 ## =>This Loop Header: Depth=1
                                        ##     Child Loop BB9_4 Depth 2
	mov	eax, dword ptr [rbp - 4]
	add	eax, 1
	mov	dword ptr [rbp - 4], eax
	cmp	eax, 64
	jge	LBB9_7
## %bb.3:                               ##   in Loop: Header=BB9_2 Depth=1
	movsxd	rax, dword ptr [rbp - 4]
	lea	rcx, [rip + ___gc_object]
	mov	rax, qword ptr [rcx + 8*rax + 8]
	mov	qword ptr [rbp - 16], rax
LBB9_4:                                 ##   Parent Loop BB9_2 Depth=1
                                        ## =>  This Inner Loop Header: Depth=2
	cmp	qword ptr [rbp - 16], 0
	je	LBB9_6
## %bb.5:                               ##   in Loop: Header=BB9_4 Depth=2
	mov	rax, qword ptr [rbp - 16]
	mov	qword ptr [rbp - 24], rax
	mov	rax, qword ptr [rbp - 16]
	mov	rdi, qword ptr [rax + 8]
	call	_free
	mov	rax, qword ptr [rbp - 16]
	mov	rax, qword ptr [rax]
	mov	qword ptr [rbp - 16], rax
	mov	rax, qword ptr [rbp - 24]
	mov	rdi, rax
	call	_free
	jmp	LBB9_4
LBB9_6:                                 ##   in Loop: Header=BB9_2 Depth=1
	movsxd	rax, dword ptr [rbp - 4]
	lea	rcx, [rip + ___gc_object]
	mov	qword ptr [rcx + 8*rax + 8], 0
	jmp	LBB9_2
LBB9_7:
	jmp	LBB9_8
LBB9_8:
	add	rsp, 32
	pop	rbp
	ret
	.cfi_endproc
                                        ## -- End function
	.globl	_gc_alloc               ## -- Begin function gc_alloc
	.p2align	4, 0x90
_gc_alloc:                              ## @gc_alloc
	.cfi_startproc
## %bb.0:
	push	rbp
	.cfi_def_cfa_offset 16
	.cfi_offset rbp, -16
	mov	rbp, rsp
	.cfi_def_cfa_register rbp
	sub	rsp, 80
	mov	qword ptr [rbp - 16], rdi
	mov	rdi, qword ptr [rbp - 16]
	call	_malloc
	mov	qword ptr [rbp - 24], rax
	cmp	rax, 0
	jne	LBB10_2
## %bb.1:
	mov	qword ptr [rbp - 8], 0
	jmp	LBB10_9
LBB10_2:
	mov	rax, qword ptr [rbp - 24]
	mov	qword ptr [rbp - 48], rax
	mov	rax, qword ptr [rbp - 16]
	mov	qword ptr [rbp - 40], rax
	mov	byte ptr [rbp - 32], 1
	mov	rax, qword ptr [rip + ___gc_object+544]
	cmp	rax, qword ptr [rbp - 24]
	jbe	LBB10_4
## %bb.3:
	mov	rax, qword ptr [rbp - 24]
	mov	qword ptr [rip + ___gc_object+544], rax
LBB10_4:
	mov	rax, qword ptr [rip + ___gc_object+552]
	mov	rcx, qword ptr [rbp - 24]
	add	rcx, qword ptr [rbp - 16]
	cmp	rax, rcx
	jae	LBB10_6
## %bb.5:
	mov	rax, qword ptr [rbp - 24]
	add	rax, qword ptr [rbp - 16]
	mov	qword ptr [rip + ___gc_object+552], rax
LBB10_6:
	lea	rax, [rip + ___gc_object]
	add	rax, 8
	mov	rcx, qword ptr [rbp - 24]
	shr	rcx, 3
	and	rcx, 63
	shl	rcx, 3
	add	rax, rcx
	mov	rdi, rax
	lea	rax, [rbp - 48]
	mov	rcx, qword ptr [rax]
	mov	qword ptr [rsp], rcx
	mov	rcx, qword ptr [rax + 8]
	mov	qword ptr [rsp + 8], rcx
	mov	rax, qword ptr [rax + 16]
	mov	qword ptr [rsp + 16], rax
	call	_gc_list_add
	mov	rax, qword ptr [rip + ___gc_object+520]
	add	rax, 1
	mov	qword ptr [rip + ___gc_object+520], rax
	mov	rax, qword ptr [rip + ___gc_object+520]
	cmp	rax, qword ptr [rip + ___gc_object+528]
	jb	LBB10_8
## %bb.7:
	call	_gc_run
LBB10_8:
	mov	rax, qword ptr [rbp - 24]
	mov	qword ptr [rbp - 8], rax
LBB10_9:
	mov	rax, qword ptr [rbp - 8]
	add	rsp, 80
	pop	rbp
	ret
	.cfi_endproc
                                        ## -- End function
	.globl	_gc_list_add            ## -- Begin function gc_list_add
	.p2align	4, 0x90
_gc_list_add:                           ## @gc_list_add
	.cfi_startproc
## %bb.0:
	push	rbp
	.cfi_def_cfa_offset 16
	.cfi_offset rbp, -16
	mov	rbp, rsp
	.cfi_def_cfa_register rbp
	sub	rsp, 64
	lea	rax, [rbp + 16]
	mov	qword ptr [rbp - 8], rdi
	cmp	qword ptr [rbp - 8], 0
	mov	qword ptr [rbp - 56], rax ## 8-byte Spill
	jne	LBB11_2
## %bb.1:
	jmp	LBB11_3
LBB11_2:
	mov	edi, 32
	call	_malloc
	mov	qword ptr [rbp - 16], rax
	mov	rax, qword ptr [rbp - 16]
	mov	rcx, qword ptr [rbp - 8]
	mov	rcx, qword ptr [rcx]
	mov	qword ptr [rbp - 48], rcx
	mov	rcx, qword ptr [rbp - 56] ## 8-byte Reload
	mov	rdx, qword ptr [rcx]
	mov	qword ptr [rbp - 40], rdx
	mov	rdx, qword ptr [rcx + 8]
	mov	qword ptr [rbp - 32], rdx
	mov	rdx, qword ptr [rcx + 16]
	mov	qword ptr [rbp - 24], rdx
	mov	rdx, qword ptr [rbp - 48]
	mov	qword ptr [rax], rdx
	mov	rdx, qword ptr [rbp - 40]
	mov	qword ptr [rax + 8], rdx
	mov	rdx, qword ptr [rbp - 32]
	mov	qword ptr [rax + 16], rdx
	mov	rdx, qword ptr [rbp - 24]
	mov	qword ptr [rax + 24], rdx
	mov	rax, qword ptr [rbp - 16]
	mov	rdx, qword ptr [rbp - 8]
	mov	qword ptr [rdx], rax
LBB11_3:
	add	rsp, 64
	pop	rbp
	ret
	.cfi_endproc
                                        ## -- End function
	.globl	_gc_free                ## -- Begin function gc_free
	.p2align	4, 0x90
_gc_free:                               ## @gc_free
	.cfi_startproc
## %bb.0:
	push	rbp
	.cfi_def_cfa_offset 16
	.cfi_offset rbp, -16
	mov	rbp, rsp
	.cfi_def_cfa_register rbp
	sub	rsp, 16
	mov	qword ptr [rbp - 8], rdi
	mov	rax, qword ptr [rbp - 8]
	shr	rax, 3
	and	rax, 63
	lea	rcx, [rip + ___gc_object]
	mov	rax, qword ptr [rcx + 8*rax + 8]
	mov	qword ptr [rbp - 16], rax
	cmp	qword ptr [rbp - 16], 0
	je	LBB12_3
## %bb.1:
	mov	rdi, qword ptr [rbp - 16]
	mov	rsi, qword ptr [rbp - 16]
	call	_gc_list_exist
	test	al, 1
	jne	LBB12_2
	jmp	LBB12_3
LBB12_2:
	mov	rsi, qword ptr [rbp - 16]
	lea	rdi, [rbp - 16]
	call	_gc_list_del
	mov	rdi, qword ptr [rbp - 16]
	call	_gc_mfree
LBB12_3:
	add	rsp, 16
	pop	rbp
	ret
	.cfi_endproc
                                        ## -- End function
	.globl	_gc_list_exist          ## -- Begin function gc_list_exist
	.p2align	4, 0x90
_gc_list_exist:                         ## @gc_list_exist
	.cfi_startproc
## %bb.0:
	push	rbp
	.cfi_def_cfa_offset 16
	.cfi_offset rbp, -16
	mov	rbp, rsp
	.cfi_def_cfa_register rbp
	mov	qword ptr [rbp - 16], rdi
	mov	qword ptr [rbp - 24], rsi
LBB13_1:                                ## =>This Inner Loop Header: Depth=1
	cmp	qword ptr [rbp - 16], 0
	je	LBB13_5
## %bb.2:                               ##   in Loop: Header=BB13_1 Depth=1
	mov	rax, qword ptr [rbp - 16]
	mov	rax, qword ptr [rax + 8]
	cmp	rax, qword ptr [rbp - 24]
	jne	LBB13_4
## %bb.3:
	mov	byte ptr [rbp - 1], 1
	jmp	LBB13_6
LBB13_4:                                ##   in Loop: Header=BB13_1 Depth=1
	mov	rax, qword ptr [rbp - 16]
	mov	rax, qword ptr [rax]
	mov	qword ptr [rbp - 16], rax
	jmp	LBB13_1
LBB13_5:
	mov	byte ptr [rbp - 1], 0
LBB13_6:
	mov	al, byte ptr [rbp - 1]
	and	al, 1
	movzx	eax, al
	pop	rbp
	ret
	.cfi_endproc
                                        ## -- End function
	.p2align	4, 0x90         ## -- Begin function list_search
_list_search:                           ## @list_search
	.cfi_startproc
## %bb.0:
	push	rbp
	.cfi_def_cfa_offset 16
	.cfi_offset rbp, -16
	mov	rbp, rsp
	.cfi_def_cfa_register rbp
	mov	qword ptr [rbp - 16], rdi
	mov	qword ptr [rbp - 24], rsi
LBB14_1:                                ## =>This Inner Loop Header: Depth=1
	cmp	qword ptr [rbp - 24], 0
	je	LBB14_7
## %bb.2:                               ##   in Loop: Header=BB14_1 Depth=1
	mov	rax, qword ptr [rbp - 16]
	mov	rcx, qword ptr [rbp - 24]
	cmp	rax, qword ptr [rcx + 8]
	jb	LBB14_5
## %bb.3:                               ##   in Loop: Header=BB14_1 Depth=1
	mov	rax, qword ptr [rbp - 24]
	mov	rax, qword ptr [rax + 8]
	mov	rcx, qword ptr [rbp - 24]
	add	rax, qword ptr [rcx + 16]
	cmp	rax, qword ptr [rbp - 16]
	jb	LBB14_5
## %bb.4:
	mov	rax, qword ptr [rbp - 24]
	mov	qword ptr [rbp - 8], rax
	jmp	LBB14_8
LBB14_5:                                ##   in Loop: Header=BB14_1 Depth=1
	jmp	LBB14_6
LBB14_6:                                ##   in Loop: Header=BB14_1 Depth=1
	mov	rax, qword ptr [rbp - 24]
	mov	rax, qword ptr [rax]
	mov	qword ptr [rbp - 24], rax
	jmp	LBB14_1
LBB14_7:
	mov	qword ptr [rbp - 8], 0
LBB14_8:
	mov	rax, qword ptr [rbp - 8]
	pop	rbp
	ret
	.cfi_endproc
                                        ## -- End function
	.globl	_gc_dump_internals      ## -- Begin function gc_dump_internals
	.p2align	4, 0x90
_gc_dump_internals:                     ## @gc_dump_internals
	.cfi_startproc
## %bb.0:
	push	rbp
	.cfi_def_cfa_offset 16
	.cfi_offset rbp, -16
	mov	rbp, rsp
	.cfi_def_cfa_register rbp
	sub	rsp, 16
	lea	rdi, [rip + L_.str]
	call	_puts
	mov	dword ptr [rbp - 4], -1
LBB15_1:                                ## =>This Loop Header: Depth=1
                                        ##     Child Loop BB15_5 Depth 2
	mov	eax, dword ptr [rbp - 4]
	add	eax, 1
	mov	dword ptr [rbp - 4], eax
	cmp	eax, 64
	jge	LBB15_9
## %bb.2:                               ##   in Loop: Header=BB15_1 Depth=1
	movsxd	rax, dword ptr [rbp - 4]
	lea	rcx, [rip + ___gc_object]
	mov	rax, qword ptr [rcx + 8*rax + 8]
	mov	qword ptr [rbp - 16], rax
	cmp	qword ptr [rbp - 16], 0
	jne	LBB15_4
## %bb.3:                               ##   in Loop: Header=BB15_1 Depth=1
	jmp	LBB15_1
LBB15_4:                                ##   in Loop: Header=BB15_1 Depth=1
	mov	esi, dword ptr [rbp - 4]
	lea	rdi, [rip + L_.str.1]
	mov	al, 0
	call	_printf
LBB15_5:                                ##   Parent Loop BB15_1 Depth=1
                                        ## =>  This Inner Loop Header: Depth=2
	cmp	qword ptr [rbp - 16], 0
	je	LBB15_8
## %bb.6:                               ##   in Loop: Header=BB15_5 Depth=2
	mov	rax, qword ptr [rbp - 16]
	mov	rsi, qword ptr [rax + 8]
	mov	rax, qword ptr [rbp - 16]
	mov	rdx, qword ptr [rax + 16]
	mov	rax, qword ptr [rbp - 16]
	mov	cl, byte ptr [rax + 24]
	and	cl, 1
	movzx	ecx, cl
	lea	rdi, [rip + L_.str.2]
	mov	al, 0
	call	_printf
## %bb.7:                               ##   in Loop: Header=BB15_5 Depth=2
	mov	rax, qword ptr [rbp - 16]
	mov	rax, qword ptr [rax]
	mov	qword ptr [rbp - 16], rax
	jmp	LBB15_5
LBB15_8:                                ##   in Loop: Header=BB15_1 Depth=1
	jmp	LBB15_1
LBB15_9:
	add	rsp, 16
	pop	rbp
	ret
	.cfi_endproc
                                        ## -- End function
	.globl	___gc_object            ## @__gc_object
.zerofill __DATA,__common,___gc_object,568,3
	.section	__TEXT,__cstring,cstring_literals
L_.str:                                 ## @.str
	.asciz	"## GC internals ##"

L_.str.1:                               ## @.str.1
	.asciz	" - GC.ptr_map[%d]:\n"

L_.str.2:                               ## @.str.2
	.asciz	"   { ptr: %p, size: %lu, marked: %d }\n"

.subsections_via_symbols
