;;; Solutions copyright (C) 2007, Peter Danenberg; http://wizardbook.org
;;; Source code copyright (C) 1996, MIT; http://mitpress.mit.edu/sicp

(load "e1-rectangle-edges.scm")
(load "e2-rectangle-edges.scm")
(load "print-segment.scm")

(define (print-rectangle-edges rectangle)
  (print-segment (e1-rectangle-edges rectangle))
  (print-segment (e2-rectangle-edges rectangle)))
