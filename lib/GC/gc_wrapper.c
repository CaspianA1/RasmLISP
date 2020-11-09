#include "tgc/tgc.c"

static tgc_t gc;

void begin_gc() {
	int argc = 0;
	tgc_start(&gc, &argc);
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