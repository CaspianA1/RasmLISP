;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
	.global display, newline
	.global plus, minus, multiply, equal
	.global bool_not, bool_and, bool_or
	.extern _printf
	.include "linked_lists.asm"  # add lib/ soon

	.data
format_number:
	.asciz "%d"
format_char:
	.asciz "%c"
newline_str:
	.asciz "\n"

	.text
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
.macro display_mac frm
	push rbp
	mov rbp, rsp
	mov rsi, [rbp + 16]
	lea rdi, \frm [rip]
	xor rax, rax
	call _printf
	mov rdi, 0
	call _fflush
	mov rsp, rbp
	pop rbp
	ret
.endm
display: display_mac format_number
display_c: display_mac format_char
/*
display_list:  # not working
	push rbp
	mov rbp, rsp
	mov rsi, [rbp + 16]	
	push 3  # see what rsi is here - 2 the first time
	# always segfaults, no matter what argument
	# try doing sub and add rsp 8, before and after
	sub rsp, 8
	call display
	add rsp, 8 (do 16?)
	recur_displaying_list:
		mov rsi, [rsi + 8]
		cmp rsi, '\0'
		je end_displaying_list
		sub rsp, 8
		push 2
		call display
		add rsp, 8
		jmp recur_displaying_list
	end_displaying_list:
		mov rsp, rbp
		pop rbp
		ret
*/

newline:
	push rbp
	mov rbp, rsp
	lea rdi, newline_str [rip]
	xor rax, rax
	call _printf
	mov rsp, rbp
	pop rbp
	ret
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
.macro operator mnemonic
push rbp
mov rbp, rsp

mov rax, [rbp + 16]
\mnemonic rax, [rbp + 24]

mov rsp, rbp
pop rbp
ret
.endm

plus: operator add
minus: operator sub
multiply: operator imul
equal:
	push rbp
	mov rbp, rsp
	mov rsi, [rbp + 16]
	cmp rsi, [rbp + 24]  # qword ptr before
	je equal_true
	mov rax, 0
	jmp equal_end
	equal_true:
		mov rax, 1
		jmp equal_end
	equal_end:
		mov rsp, rbp
		pop rbp
		ret

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
bool_not:
	push rbp
	mov rbp, rsp
	mov rax, [rbp + 16]
	cmp rax, 0
	je not_to_one
	mov rax, 0
	jmp not_end
	not_to_one:
		mov rax, 1
	not_end:
		mov rsp, rbp
		pop rbp
		ret

bool_and:
	push rbp
	mov rbp, rsp
	mov rax, [rbp + 16]
	cmp rax, 0  # first is false?
	je and_end
	jmp and_first_true
	and_first_true:
		mov rax, [rbp + 24]  # second is false?
		cmp rax, 0
		je and_end
		mov rax, 1  # both are true
		jmp and_end
	and_end:  # rax is already 0
		mov rsp, rbp
		pop rbp
		ret

bool_or:
	push rbp
	mov rbp, rsp

	mov rax, [rbp + 16]
	cmp rax, 0
	jne or_is_true
	jmp or_keep_checking
	or_keep_checking:
		mov rax, [rbp + 24]
		cmp rax, 0
		jne or_is_true
		jmp or_end
	or_is_true:
		mov rax, 1
		# will naturally go to or_end
	or_end:
		mov rsp, rbp
		pop rbp
		ret
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
