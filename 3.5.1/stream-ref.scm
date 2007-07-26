(load "stream-car.scm")
(load "stream-cdr.scm")

(define (stream-ref s n)
  (if (zero? n)
      (stream-car s)
      (stream-ref (stream-cdr s) (- n 1))))
