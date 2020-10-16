;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
	.global display, newline
	.global plus, minus, multiply, equal
	.global bool_and, bool_or, bool_not
	.extern _printf

	.data
format_number:
	.asciz "%d"
newline_str:
	.asciz "\n"

	.text
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
display:
	push rbp
	mov rbp, rsp
	mov rsi, [rbp + 16]  # should be 25
	lea rdi, format_number [rip]
	xor rax, rax
	call _printf
	mov rdi, 0
	call _fflush
	mov rsp, rbp
	pop rbp
	ret

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