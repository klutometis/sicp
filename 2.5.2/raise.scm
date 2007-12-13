;;; Solutions copyright (C) 2007, Peter Danenberg; http://wizardbook.org
;;; Source code copyright (C) 1996, MIT; http://mitpress.mit.edu/sicp

(load "get.scm")
(load "apply-generic.scm")
(load "put-irreducible.scm")

(define (raise x)
  (put-irreducible 'raise)
  (apply-generic 'raise x))
