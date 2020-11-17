	.global start_curses, init_color, activate_color, deactivate_color, printscr, readch

start_curses:
	push rbp
	mov rbp, rsp
	and rsp, -16
	call _initscr
	call _cbreak
	call _noecho
	call _start_color
	call _use_default_colors

	mov	rax, qword ptr [rip + _stdscr@GOTPCREL]
	mov	rdi, qword ptr [rax]
	mov	esi, 1
	call _keypad

	mov rsp, rbp
	pop rbp
	ret

init_color:
	push rbp
	mov rbp, rsp
	mov edi, [rbp + 16]
	mov esi, [rbp + 24]
	mov edx, [rbp + 32]
	and rsp, -16
	call _init_pair
	mov rsp, rbp
	pop rbp
	ret

.macro color_activation mode
	push rbp
	mov	rbp, rsp
	mov edi, [rbp + 16]
	mov	esi, edi
	mov	rax, qword ptr [rip + _stdscr@GOTPCREL]
	mov	rdi, qword ptr [rax]
	shl	esi, 8
	xor	edx, edx
	and rsp, -16
	call \mode
	mov rsp, rbp
	pop	rbp
	ret
.endm

activate_color: color_activation _wattr_on
deactivate_color: color_activation _wattr_off

printscr:
	push rbp
	mov	rbp, rsp
	mov edi, [rbp + 16]
	mov esi, [rbp + 24]
	mov edx, [rbp + 32]
	mov	ecx, edx
	lea	rdx, [rip + char_frm]
	xor	eax, eax
	and rsp, -16
	call _mvprintw
	mov rsp, rbp
	pop	rbp
	ret

readch:
	push rbp
	mov rbp, rsp
	and rsp, -16
	call _getch
	mov rsp, rbp
	pop rbp
	ret

	.data

char_frm:
	.asciz "%c"