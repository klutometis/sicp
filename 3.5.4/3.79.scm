;;; Solutions copyright (C) 2007, Peter Danenberg; http://wizardbook.org
;;; Source code copyright (C) 1996, MIT; http://mitpress.mit.edu/sicp

(load "test.scm")
(load "solve-2nd.scm")

(define solution (stream-ref (solve-2nd (lambda (a b) (- (- a) b)) 1 1 0.001) 1000))

(test
 "general second order solver"
 '1.1936006420917238
 solution
 '=
 =)
