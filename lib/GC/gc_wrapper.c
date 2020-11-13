#include "tgc/tgc.c"

static tgc_t gc;

void begin_gc() {
	int stack_var[2] = {1, 2};
	tgc_start(&gc, stack_var);
	// do I need to invoke tgc_run?
	// or use a special_flag? (https://github.com/orangeduck/tgc)
	// what if I use my assembly stack bottom trick?
}

void* allocate(size_t byte_count) {
	return tgc_alloc(&gc, byte_count);
}

void end_gc() {
	tgc_stop(&gc);
}

/*
int main() {
	begin_gc();
	int* mem_block = allocate(sizeof(int));
	*mem_block = 2345;
	end_gc();
}
*/
