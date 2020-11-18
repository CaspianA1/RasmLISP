(define terrain (list #\_ #\_ #\_ #\.))

(start_curses)

(printscr 0 0(car terrain))
(readch)

(end_curses)