#include <curses.h>

int main() {
	initscr();
	int max_y = getmaxy(stdscr);
	endwin();
	return 0;
}