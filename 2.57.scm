#!/usr/bin/env chicken-scheme
(use sicp test)

(define (augend x)
  (let ((augenda (cddr x)))
    (if (null? (cdr augenda))
        (car augenda)
        (cons '+ augenda))))

(define (multiplicand x)
  (let ((multiplicanda (cddr x)))
    (if (null? (cdr multiplicanda))
        (car multiplicanda)
        (cons '* multiplicanda))))

(test '(+ (* x y) (* y (+ x 3))) (deriv '(* x y (+ x 3)) 'x))
