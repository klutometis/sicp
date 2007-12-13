;;; Solutions copyright (C) 2007, Peter Danenberg; http://wizardbook.org
;;; Source code copyright (C) 1996, MIT; http://mitpress.mit.edu/sicp

(load "smallest-divisor.scm")

(define (prime? n)
  (= n (smallest-divisor n)))
