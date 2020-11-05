	.global _main
	.include "gc_wrapper.asm"
	.text

.macro begin_collection
call _begin_gc
and rsp, -16
.endm

.macro end_collection
and rsp, -16
call _end_gc
.endm

_main:
	begin_collection

	# alloc is only used in one place, so inlining this should be fine
	mov edi, 100
	call _allocate
	mov qword ptr [rax], 24  # rax can be loaded here

	end_collection
	mov rdi, 0
	mov rax, 0x2000001
	syscall

# find the symbols I defined in gc_wrapper.c within c_collector.asm, and then use those.