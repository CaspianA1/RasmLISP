	.global _main
	.text
_main:
	call _begin_gc
	and rsp, -16  # begin garbage collector
	push 9  # push argument to +
	push 3  # push argument to *
	push 2  # push argument to *
	call multiply
	add rsp, 16  # discard 2 local arguments
	push rax  # result of *
	call plus
	add rsp, 16  # discard 2 local arguments
	mov [x + rip], rax
	push 6  # push argument to eq?
	push [x + rip]  # push global variable
	call eq?
	add rsp, 16  # discard 2 local arguments
	cmp rax, 1  # is true?
	je true_2  # true branch
	jmp false_3  # false branch
	true_2:
	push 3  # push argument to +
	push 2  # push argument to +
	call plus
	add rsp, 16  # discard 2 local arguments
	jmp end_4
	false_3:
	push 7  # push argument to eq?
	push [x + rip]  # push global variable
	call eq?
	add rsp, 16  # discard 2 local arguments
	cmp rax, 1  # is true?
	je true_5  # true branch
	jmp false_6  # false branch
	true_5:
	mov rax, 2
	jmp end_7
	false_6:
	push 8  # push argument to eq?
	push [x + rip]  # push global variable
	call eq?
	add rsp, 16  # discard 2 local arguments
	cmp rax, 1  # is true?
	je true_8  # true branch
	jmp false_9  # false branch
	true_8:
	mov rax, 3
	jmp end_10
	false_9:
	push 4  # push argument to *
	push 3  # push argument to *
	call multiply
	add rsp, 16  # discard 2 local arguments
	jmp end_10
	end_10:
	jmp end_7
	end_7:
	jmp end_4
	end_4:
	mov [result + rip], rax
	push [result + rip]  # push global variable
	call display_num
	add rsp, 8  # discard 1 local argument
	and rsp, -16
	call _end_gc  # end garbage collector
	xor rdi, rdi
	mov rax, 0x2000001
	syscall

	.data
x:
	.quad 0
result:
	.quad 0
