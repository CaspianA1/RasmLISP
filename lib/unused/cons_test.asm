	.global _main
	.include "linked_lists.asm"
	.text

cons:
	push rbp
	mov rbp, rsp
	mov r13, 2
	push [rbp + 24]
	push [rbp + 16]
	call make_list
	add rsp, 16
	mov rsp, rbp
	pop rbp
	ret

_main:
	push 3
	push 2
	call cons
	add rsp, 16

	# consing lists:
	push [rax]  # if you push a pointer, it gets easier (maybe?)
	push 1
	call cons
	add rsp, 16

	/*
	expected:
	[rax] = 1 (works)
	[r13] = 2 (too much hassle to work)
	[r14] + 3 (hassle again)
	*/

	/*
	mov r12, [rax + 8]
	mov r12, [r12]
	mov r13, [r12]

	mov r14, [r12 + 8]

	mov rdi, [r14]
	*/

	/*
	mov r9, [rax + 8]  # r9 = a ptr to a ptr
	mov r9, [r9]
	mov r9, [r9]
	*/

	# with tags, accessing double pointers should be easier

	mov r8, rax  # [r8] = 1
	mov r9, [r8 + 8]  # [r9] = 2
	mov r10, [r9 + 8]  # [r10] = segfault

	mov rdi, [r10]
	mov rax, 0x2000001
	syscall