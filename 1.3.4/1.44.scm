;;; Solutions copyright (C) 2007, Peter Danenberg; http://wizardbook.org
;;; Source code copyright (C) 1996, MIT; http://mitpress.mit.edu/sicp

(load "repeated.scm")

(define dx 0.00001)
(define (smooth f)
  (lambda (x)
    (/ (+ (f (- x dx)) (f x) (f (+ x dx))) 3)))

((smooth sin) 1.0)

(define (n-fold-smooth f n)
  (lambda (x) ((repeated (smooth f) n) x)))

((n-fold-smooth sin 4) 1.0)
