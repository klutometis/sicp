;;; Solutions copyright (C) 2007, Peter Danenberg; http://wizardbook.org
;;; Source code copyright (C) 1996, MIT; http://mitpress.mit.edu/sicp

(load "make-connector.scm")
(load "multiplier.scm")
(load "adder.scm")
(load "constant.scm")

(define (averager a b c)
  (let ((u (make-connector))
        (v (make-connector)))
    (multiplier c u v)
    (constant 2 u)
    (adder a b v)
    'ok))
