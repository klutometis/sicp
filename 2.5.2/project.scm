;;; Solutions copyright (C) 2007, Peter Danenberg; http://wizardbook.org
;;; Source code copyright (C) 1996, MIT; http://mitpress.mit.edu/sicp

(load "apply-generic.scm")
(load "put-irreducible.scm")

(define (project x)
  (put-irreducible 'project)
  (apply-generic 'project x))
