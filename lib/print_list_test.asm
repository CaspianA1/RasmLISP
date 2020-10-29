	.global _main
	.text
	.include "lib.asm"

prl:
	push rbp
	mov rbp, rsp
	sub rsp, 8
	push '('
	call display_c
	add rsp, 8
	mov r12, [rbp + 16]
	prl_recur:
		cmp r12, '\0'
		je prl_end
		push [r12]
		call display
		add rsp, 8
		mov r12, [r12 + 8]
		push ' '
		call display_c
		add rsp, 8
		jmp prl_recur
	prl_end:
		push '\b'
		call display_c
		add rsp, 8
		push ')'
		call display_c
		add rsp, 8
		mov rsp, rbp
		pop rbp
		ret
# figure out how to integrate this function into the normal `display`. i.e making it polymorphic
# unrelated sitenote: add the `null?` function, and base it on trying to make an empty list


_main:
	mov r13, 6
	push 6
	push 5
	push 4
	push 3
	push 2
	push 1
	call make_list
	add rsp, 48

	push r15
	call prl
	add rsp, 8
	call newline

	mov rdi, 0
	mov rax, 0x2000001
	syscall