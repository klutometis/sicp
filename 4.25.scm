#!/usr/bin/env chicken-scheme
(use bindings debug sicp test)

(define (unless* condition usual-value exceptional-value)
  (if condition exceptional-value usual-value))

(define (factorial n)
  (unless* (= n 1)
    (* n (factorial (- n 1)))
    1))

(test-assert "Greedy unless doesn't terminate." (not (terminates? (lambda () (factorial 5)))))

(define-macro (unless* condition usual-value exceptional-value)
  `(if ,condition ,exceptional-value ,usual-value))

(define (factorial n)
  (unless* (= n 1)
    (* n (factorial (- n 1)))
    1))

(test "Lazy unless does terminate." 120 (factorial 5))
