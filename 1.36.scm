#!/usr/bin/env chicken-scheme
(use test)

(define tolerance (make-parameter 0.00001))

(define count (make-parameter 0))

(define (fixed-point f first-guess)
  (define (close-enough? v1 v2)
    (< (abs (- v1 v2))
       (tolerance)))
  (define (try guess)
    (count (+ (count) 1))
    (let ((next (f guess)))
      (if (close-enough? guess next)
          next
          (try next))))
  (try first-guess))

(parameterize ((count 0))
  (test 4.5555 (fixed-point (lambda (x) (/ (log 1000) (log x))) 4))
  (test 29 (count)))

(parameterize ((count 0))
  (test 4.5555 (fixed-point (lambda (x) (/ (+ x (/ (log 1000) (log x))) 2)) 4))
  (test 7 (count)))
