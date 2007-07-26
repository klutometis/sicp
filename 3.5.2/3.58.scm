(load "display-stream-n.scm")

;; Decimal expansion of fractions
(define (expand num den radix)
  (cons-stream
   (quotient (* num radix) den)
   (expand (remainder (* num radix) den) den radix)))

(define expansion-1/7 (stream-head (expand 1 7 10) 10))
(define expansion-3/8 (stream-head (expand 3 8 10) 10))

(test
 "decimal expansion of 1/7"
 '(1 4 2 8 5 7 1 4 2 8)
 expansion-1/7
 equal?)

(test
 "decimal expansion of 3/8"
 '(3 7 5 0 0 0 0 0 0 0)
 expansion-3/8
 equal?)

