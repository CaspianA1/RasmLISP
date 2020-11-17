#include "ogc/src/core.c"
#include "ogc/src/alloc.c"
#include "ogc/src/list.c"
#include "ogc/src/utils.c"

/*
int main() {
	char a = 5;
	gc_init(&a, 16);

	int* num = gc_alloc(4);
	*num = 100;
}
*/
// gcc -o ogc.asm -S -masm=intel -O1 gc.c