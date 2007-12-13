;;; Solutions copyright (C) 2007, Peter Danenberg; http://wizardbook.org
;;; Source code copyright (C) 1996, MIT; http://mitpress.mit.edu/sicp

(define (logical-or a b)
  (if (and (zero? a) (zero? b))
      0
      1))
