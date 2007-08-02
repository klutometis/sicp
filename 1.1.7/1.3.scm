(load "test.scm")

;; TODO: cleanup!
(define (square x) (* x x))
(define (sum-square x y) (+ (square x) (square y)))
(define (sum-square-max x y z)
  (define a (if (> x y) x y))
  (define b (if (> x z) x z))
  (set! b (if (> y z) y z))
  (if (= a b)
      (set! b (if (> x z) x z)))
  (sum-square a b))

(define max-sum (sum-square-max 1 2 3))

(test
 "sum of squares of two largest integers"
 13
 max-sum
 '= =)
