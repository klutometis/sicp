#!/usr/bin/env chicken-scheme

(use sicp sicp-streams test)

(include "stream-limit.scm")

(define (sqrt-improve guess x)
  (average guess (/ x guess)))

(define (sqrt-stream x)
  (letrec ((guesses
            (cons-stream 1.0
                         (stream-map
                          (lambda (guess) (sqrt-improve guess x))
                          guesses))))
    guesses))

(test (sqrt 2) (stream-limit (sqrt-stream 2) 0.001))
