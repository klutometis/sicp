(load "smallest-divisor.scm")

(define (prime? n)
  (= n (smallest-divisor n)))
