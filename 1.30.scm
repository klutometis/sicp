#!/usr/bin/env chicken-scheme

;; [[file:~/prg/sicp-klutometis/sicp.org::*1.30][1\.30:1]]

(use test)

(define (inc n) (+ n 1))

(define (cube x) (* x x x))

(define (sum-cubes a b)
  (sum cube a inc b))

(define (sum term a next b)
  (let iter ((a a)
             (result 0))
    (if (> a b)
        result
        (iter (next a) (+ result (term a))))))

(test "Iterative sum"
      3025
      (sum-cubes 1 10))

;; 1\.30:1 ends here
