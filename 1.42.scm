(load "compose.scm")

(define (inc n) (+ n 1))
(define (square n) (* n n))
((compose square inc) 6)
