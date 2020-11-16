(start_curses)

(init_color 1 2 3)
(init_color 2 5 5)

(activate_color 2)

(define response (readch))
(print_char 2 3 response)

(refresh)

(deactivate_color 2)

(readch)

(end_curses)