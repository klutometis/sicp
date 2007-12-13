;;; Solutions copyright (C) 2007, Peter Danenberg; http://wizardbook.org
;;; Source code copyright (C) 1996, MIT; http://mitpress.mit.edu/sicp

(load "compose.scm")

(define (inc n) (+ n 1))
(define (square n) (* n n))
((compose square inc) 6)
