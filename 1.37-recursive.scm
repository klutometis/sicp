#!/usr/bin/env chicken-scheme

(use test)

(include "cont-frac.scm")

;;; The phi conjugate
(define phi 0.618033989)

(test
 "k must be 11 to converge on Phi to within 0.00001."
 11
 (let iter ((k 0))
   (let ((cont-frac-phi (cont-frac (lambda (i) 1.0) (lambda (i) 1.0) k)))
     (if (< (abs (- phi cont-frac-phi)) 0.00001)
         k
         (iter (+ k 1))))))
