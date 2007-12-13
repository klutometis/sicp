;;; Solutions copyright (C) 2007, Peter Danenberg; http://wizardbook.org
;;; Source code copyright (C) 1996, MIT; http://mitpress.mit.edu/sicp

(load "newtons-method.scm")

(define (cube x) (* x x x))

(define (cubic a b c)
  (lambda (x) (+ (cube x) (* a (square x)) (* b x) c))
  )

(newtons-method (cubic 4 5 2) 1)
