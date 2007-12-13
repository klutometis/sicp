;;; Solutions copyright (C) 2007, Peter Danenberg; http://wizardbook.org
;;; Source code copyright (C) 1996, MIT; http://mitpress.mit.edu/sicp

(define (print-point point)
  (display (string-append "(" (number->string (x-point point)) ", " (number->string (y-point point)) ")"))
  (newline))
