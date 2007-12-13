;;; Solutions copyright (C) 2007, Peter Danenberg; http://wizardbook.org
;;; Source code copyright (C) 1996, MIT; http://mitpress.mit.edu/sicp

(load "fixed-point.scm")

(fixed-point (lambda (x) (/ (log 1000) (log x))) 10.0)
(fixed-point (lambda (x) (average x (/ (log 1000) (log x)))) 10.0)

;; 32 vs. 9 steps; 400%.
