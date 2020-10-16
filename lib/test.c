#include <stdio.h>

int j = 35;

void add(int a, int b) {
	j += a / b;
}

int main() {
	add(2, 3);

	printf("%d", j);
}