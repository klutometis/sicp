;;; Solutions copyright (C) 2007, Peter Danenberg; http://wizardbook.org
;;; Source code copyright (C) 1996, MIT; http://mitpress.mit.edu/sicp

(load "make-connector.scm")
(load "adder.scm")

(define (c+ x y)
  (let ((z (make-connector)))
    (adder x y z)
    z))
