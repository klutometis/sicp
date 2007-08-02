(load "accumulate.scm")
(load "nil.scm")

(define (flatmap proc seq)
  (accumulate append nil (map proc seq)))
