;;; Solutions copyright (C) 2007, Peter Danenberg; http://wizardbook.org
;;; Source code copyright (C) 1996, MIT; http://mitpress.mit.edu/sicp

(load "make-connector.scm")
(load "probe.scm")
(load "set-value!.scm")
(load "squarer.scm")

(define a (make-connector))
(define b (make-connector))

(squarer a b)

(probe 'a a)
(probe 'b b)

(set-value! a 1.4142135623730951 'user)
(forget-value! a 'user)
(set-value! b -1 'user)
(forget-value! b 'user)
(set-value! b 4 'user)
