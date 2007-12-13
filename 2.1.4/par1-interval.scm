;;; Solutions copyright (C) 2007, Peter Danenberg; http://wizardbook.org
;;; Source code copyright (C) 1996, MIT; http://mitpress.mit.edu/sicp

(load "div-interval.scm")
(load "mul-interval.scm")
(load "add-interval.scm")

(define (par1-interval r1 r2)
  (div-interval (mul-interval r1 r2)
                (add-interval r1 r2)))
