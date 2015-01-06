#!/usr/bin/env chicken-scheme

;; [[file:~/prg/sicp-klutometis/sicp.org::*1.31][1\.31:1]]

(use test)

(define (inc n) (+ n 1))

(define (product term a next b)
  (if (> a b)
      1
      (* (term a) (product term (next a) next b))))

(define (factorial n)
  (product identity 1 inc n))

(test 120 (factorial 5))

(define (pi n)
  (define (numerator-term i)
    (* (ceiling (/ (+ i 2) 2)) 2))
  (define (denominator-term i)
    (+ 1 (* (floor (/ (+ i 2) 2)) 2)))
  (* 4 (/ (product numerator-term 0 inc n)
          (product denominator-term  0 inc n))))

(parameterize ((current-test-epsilon 0.1))
  (test 3.1 (pi 100)))

;; 1\.31:1 ends here
