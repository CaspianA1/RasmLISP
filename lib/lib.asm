;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
	.global display_num, display_char, newline
	.global plus, minus, multiply, id, add1, sub1, equal
	.global greater, greater_eq, smaller, smaller_eq
	.global bool_not, bool_and, bool_or
	.global atom?
	.extern _printf
	.include "lib/tagged_list.asm"
	.include "lib/list_print_revision.asm"

	.data
format_number:
	.asciz "%d"
format_char:
	.asciz "%c"
newline_str:
	.asciz "\n"

	.text
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
.macro enter_frame
push rbp
mov rbp, rsp
.endm

.macro exit_frame
mov rsp, rbp
pop rbp
ret
.endm

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
.macro display_mac frm
	enter_frame
	mov rsi, [rbp + 16]
	lea rdi, \frm [rip]
	xor rax, rax
	and rsp, -16  # recently added
	call _printf
	mov rdi, 0
	call _fflush
	exit_frame
.endm
display_num: display_mac format_number
display_char: display_mac format_char
newline:
	enter_frame
	lea rdi, newline_str [rip]
	xor rax, rax
	call _printf
	exit_frame
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
.macro operator mnemonic
enter_frame
mov rax, [rbp + 16]
\mnemonic rax, [rbp + 24]
exit_frame
.endm

plus: operator add
minus: operator sub
multiply: operator imul

add1:
	enter_frame
	mov rax, [rbp + 16]
	inc rax
	exit_frame

sub1:
	enter_frame
	mov rax, [rbp + 16]
	dec rax
	exit_frame

equal:
	enter_frame
	mov rsi, [rbp + 16]
	cmp rsi, [rbp + 24]  # qword ptr before
	je equal_true
	mov rax, 0
	jmp equal_end
	equal_true:
		mov rax, 1
		jmp equal_end
	equal_end:
		exit_frame

.macro compare comparator cmp_t cmp_f cmp_end
enter_frame
mov rax, [rbp + 16]
cmp rax, [rbp + 24]
\comparator \cmp_t
jmp \cmp_f
\cmp_t:  # redefined
	mov rax, 1
	jmp \cmp_end
\cmp_f:
	mov rax, 0
\cmp_end:
	exit_frame
.endm

greater: compare jg, g_t, g_f, g_e
greater_eq: compare jge, ge_t, ge_f, ge_e
smaller: compare jl, s_t, s_f, s_e
smaller_eq: compare jle, se_t, se_f, se_e
# do rest
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
bool_not:
	enter_frame
	mov rax, [rbp + 16]
	cmp rax, 0
	je not_to_one
	mov rax, 0
	jmp not_end
	not_to_one:
		mov rax, 1
	not_end:
		exit_frame

bool_and:
	enter_frame
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
		exit_frame

bool_or:
	enter_frame

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
		exit_frame
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
atom?:
	enter_frame
	mov rax, [rbp + 16]
	cmp rax, 2147483647
	jg is_ptr
	mov rax, 1
	jmp end_atom?
	is_ptr:
		mov rax, 0
	end_atom?:
		exit_frame
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;