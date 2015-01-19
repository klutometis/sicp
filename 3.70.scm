#!/usr/bin/env chicken-scheme

(use bindings sicp-streams srfi-1 test)

(include "weighted-pairs.scm")

(define (test-weighted-pairs weight pairs)
  (let ((pairs (stream->list pairs 16)))
    (every (lambda (p1 p2) (<= (weight p1) (weight p2)))
         pairs
         (cdr pairs))))

(let* ((addition-weight (cut apply + <>))
       (addition-weighted-integer-pairs
        (weighted-pairs addition-weight integers integers)))
  (test-assert (test-weighted-pairs
                addition-weight
                addition-weighted-integer-pairs))
  (test '((1 1) (1 2) (2 2) (1 3) (2 3) (1 4) (3 3) (2 4) (1 5) (3 4) (2 5)
          (1 6) (4 4) (3 5) (2 6) (1 7))
        (stream->list addition-weighted-integer-pairs 16)))

(letrec ((hamming-numbers
          (cons-stream 1 (merge (scale-stream hamming-numbers 2)
                                (merge (scale-stream hamming-numbers 3)
                                       (scale-stream hamming-numbers 5))))))
  (let* ((weight (bind-lambda (i j) (+ (* 2 i) (* 3 j) (* 5 i j))))
         (weighted-hamming-pairs
          (weighted-pairs weight hamming-numbers hamming-numbers)))
    (test-assert (test-weighted-pairs weight weighted-hamming-pairs))
    (test '((1 1) (1 2) (1 3) (2 2) (1 4) (1 5) (2 3) (1 6) (2 4) (3 3)
            (1 8) (2 5) (1 9) (3 4) (2 6) (1 10))
          (stream->list weighted-hamming-pairs 16))))
