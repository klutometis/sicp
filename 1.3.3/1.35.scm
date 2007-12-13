;;; Solutions copyright (C) 2007, Peter Danenberg; http://wizardbook.org
;;; Source code copyright (C) 1996, MIT; http://mitpress.mit.edu/sicp

(load "fixed-point.scm")

;; phi^2 = phi + 1; phi -> 1 + 1 / phi

(define (phi)
  (fixed-point (lambda (x) (+ 1 (/ 1 x))) 1.0))

(phi)
