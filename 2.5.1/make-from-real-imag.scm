;;; Solutions copyright (C) 2007, Peter Danenberg; http://wizardbook.org
;;; Source code copyright (C) 1996, MIT; http://mitpress.mit.edu/sicp

(load "get.scm")

(define (make-from-real-imag x y)
  ((get 'make-from-real-imag 'rectangular) x y))
