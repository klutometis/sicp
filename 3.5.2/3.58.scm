(load "display-stream-n.scm")

;; Decimal expansion of fractions
(define (expand num den radix)
  (cons-stream
   (quotient (* num radix) den)
   (expand (remainder (* num radix) den) den radix)))

(display-stream-n (expand 1 7 10) 10)
(display-stream-n (expand 3 8 10) 10)
