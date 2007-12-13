;;; Solutions copyright (C) 2007, Peter Danenberg; http://wizardbook.org
;;; Source code copyright (C) 1996, MIT; http://mitpress.mit.edu/sicp

(define (logical-and a b)
  (if (zero? a)
      0
      (if (zero? b)
          0
          1)))
