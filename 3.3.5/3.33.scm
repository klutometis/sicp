;;; Solutions copyright (C) 2007, Peter Danenberg; http://wizardbook.org
;;; Source code copyright (C) 1996, MIT; http://mitpress.mit.edu/sicp

(load "make-connector.scm")
(load "averager.scm")
(load "probe.scm")
(load "set-value!.scm")

(define a (make-connector))
(define b (make-connector))
(define c (make-connector))

(averager a b c)

(probe 'a a)
(probe 'b b)
(probe 'c c)

(set-value! a 1 'user)
(set-value! b 3 'user)
