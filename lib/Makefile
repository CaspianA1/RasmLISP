CC = gcc
SYNTAX = -masm=intel

LL_ASM_FLAGS = -O0 -S $(SYNTAX) -fverbose-asm

CALL_LIB_FLAGS = -O0 $(SYNTAX) -mstackrealign
LINK_WITH = linked_list.s

ll_asm:
	$(CC) $(LL_ASM_FLAGS) linked_list.c
ll_bin:
	$(CC) -o ll linked_list.c
call_lib: ll_asm
	$(CC) $(CALL_LIB_FLAGS) -o call_lib $(LINK_WITH) call_lib.asm
# -mno-push-args doesn't work?

t_args = -mstackrealign -fverbose-asm -S -masm=intel -O0 -mpush-args

t:
	gcc $(t_args) test.c