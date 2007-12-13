;;; Solutions copyright (C) 2007, Peter Danenberg; http://wizardbook.org
;;; Source code copyright (C) 1996, MIT; http://mitpress.mit.edu/sicp

;; A rectangle represented by two lines: its edges.
(define (make-rectangle-edges edge1 edge2)
  (cons edge1 edge2))
