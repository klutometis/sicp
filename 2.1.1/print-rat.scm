;;; Solutions copyright (C) 2007, Peter Danenberg; http://wizardbook.org
;;; Source code copyright (C) 1996, MIT; http://mitpress.mit.edu/sicp

(define (print-rat x)
  (newline)
  (display (numer x))
  (display "/")
  (display (denom x)))
