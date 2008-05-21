;;; Solutions copyright (C) 2007, Peter Danenberg; http://wizardbook.org
;;; Source code copyright (C) 1996, MIT; http://mitpress.mit.edu/sicp

(define (fixed-point-of-transform g transform guess)
  (fixed-point (transform g) guess))

(define (average-damp f)
  (lambda (x) (average x (f x))))

(define (compose f g) (lambda (x) (f (g x))))

(define (repeated f n)
  (cond ((< n 1) (lambda (x) x))
        ((= n 1) (lambda (x) (f x)))
        (else (compose f (repeated f (- n 1))))))
