;;; Solutions copyright (C) 2007, Peter Danenberg; http://wizardbook.org
;;; Source code copyright (C) 1996, MIT; http://mitpress.mit.edu/sicp

(load "make-connector.scm")
(load "constant.scm")

(define (cv x)
  (let ((y (make-connector)))
    (constant x y)
    y))
