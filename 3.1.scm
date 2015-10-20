#!/usr/bin/env chicken-scheme
(use test)

(define (make-accumulator accumulatum)
  (lambda (accumulandum)
    (set! accumulatum (+ accumulandum accumulatum))
    accumulatum))

(let ((accumulator (make-accumulator 5)))
  (test 10 (accumulator 5))
  (test 15 (accumulator 5)))
