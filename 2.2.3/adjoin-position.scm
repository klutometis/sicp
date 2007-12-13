;;; Solutions copyright (C) 2007, Peter Danenberg; http://wizardbook.org
;;; Source code copyright (C) 1996, MIT; http://mitpress.mit.edu/sicp

(define (adjoin-position new-row k rest-of-queens)
;;   (display new-row)
;;   (display k)
;;   (display rest-of-queens)
;;   (display (cons new-row rest-of-queens))
;;   (newline)
  (cons new-row rest-of-queens))
