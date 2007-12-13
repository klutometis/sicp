;;; Solutions copyright (C) 2007, Peter Danenberg; http://wizardbook.org
;;; Source code copyright (C) 1996, MIT; http://mitpress.mit.edu/sicp

(define an-integer-between
  '(define (an-integer-between low high)
     (require (>= high low))
     (amb low (an-integer-between (+ low 1) high))))
