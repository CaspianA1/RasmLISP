	.section	__TEXT,__text,regular,pure_instructions
	.build_version macos, 10, 15	sdk_version 10, 15, 6
	.intel_syntax noprefix
	.globl	_main                   ## -- Begin function main
	.p2align	4, 0x90
_main:                                  ## @main
	.cfi_startproc
## %bb.0:
	push	rbp
	.cfi_def_cfa_offset 16
	.cfi_offset rbp, -16
	mov	rbp, rsp
	.cfi_def_cfa_register rbp
	call	_initscr
	mov	rax, qword ptr [rip + _stdscr@GOTPCREL]
	mov	rdi, qword ptr [rax]
	call	_getmaxy
	call	_endwin
	xor	eax, eax
	pop	rbp
	ret
	.cfi_endproc
                                        ## -- End function
.subsections_via_symbols
