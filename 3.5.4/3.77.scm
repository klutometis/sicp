;;; Solutions copyright (C) 2007, Peter Danenberg; http://wizardbook.org
;;; Source code copyright (C) 1996, MIT; http://mitpress.mit.edu/sicp

(load "test.scm")
(load "tolerant=.scm")
(load "solve.scm")

(define e-integral (stream-ref (solve (lambda (y) y) 1 0.001) 1000))

(test
 "e vs. 1000th iteration of delayed integation"
 (exp 1)
 e-integral
 '(tolerant= e e-integral 0.01)
 (lambda (x y) (tolerant= x y 0.01))
 '(exp 1))
