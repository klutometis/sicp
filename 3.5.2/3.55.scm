(load "stream-car.scm")
(load "stream-cdr.scm")
(load "integers.scm")
(load "add-streams.scm")
(load "display-stream-n.scm")

(define (partial-sums stream)
  (cons-stream (stream-car stream)
               (add-streams (stream-cdr stream) (partial-sums stream))))
(display-stream-n (partial-sums integers) 10)