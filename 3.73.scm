#!/usr/bin/env chicken-scheme
(use sicp-streams test)

(include "add-streams.scm")

(define (integral integrand initial-value dt)
  (define int
    (cons-stream initial-value
                 (add-streams (scale-stream integrand dt)
                              int)))
  int)

(define (RC R C dt)
  (lambda (i v0)
    (add-streams (scale-stream i R)
                 (integral (scale-stream i (/ 1 C))
                           v0
                           dt))))

(let ((RC1 (RC 5 1 0.5)))
  (test '(5 10.5 16.5 23.0 30.0 37.5)
        (stream->list (RC1 integers 0) 6)))
