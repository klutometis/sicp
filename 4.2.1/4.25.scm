;;; Solutions copyright (C) 2007, Peter Danenberg; http://wizardbook.org
;;; Source code copyright (C) 1996, MIT; http://mitpress.mit.edu/sicp

(define (unless condition usual-value exceptional-value)
  (if condition (force exceptional-value) (force usual-value)))

(define (factorial n)
  (unless (= n 1)
          (delay (* n (factorial (- n 1))))
          (delay 1)))

(factorial 5)

;; Simulate normal-order with delay.
