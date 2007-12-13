;;; Solutions copyright (C) 2007, Peter Danenberg; http://wizardbook.org
;;; Source code copyright (C) 1996, MIT; http://mitpress.mit.edu/sicp

(load "apply-generic.scm")
(load "put-irreducible.scm")

(define (equ? x y)
  (put-irreducible 'equ?)
  (apply-generic 'equ? x y))
