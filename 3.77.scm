#!/usr/bin/env chicken-scheme
(use sicp-streams test)

(include "add-streams.scm")

(define (integral delayed-integrand initial-value dt)
  (cons-stream
   initial-value
   (let ((integrand (force delayed-integrand)))
     (if (stream-null? integrand)
         stream-null
         (integral (delay (stream-cdr integrand))
                   (+ (* dt (stream-car integrand))
                      initial-value)
                   dt)))))

(define (solve f y0 dt)
  (define y (integral (delay dy) y0 dt))
  (define dy (stream-map f y))
  y)

(parameterize ((current-test-epsilon 0.001))
  (test 2.71828 (stream-ref (solve identity 1 0.001) 1000)))
