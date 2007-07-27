(load "test.scm")
(load "stream-car.scm")
(load "stream-cdr.scm")
(load "integers.scm")
(load "add-streams.scm")
(load "display-stream-n.scm")

(define (partial-sums stream)
  (cons-stream (stream-car stream)
               (add-streams (stream-cdr stream) (partial-sums stream))))
(define sums (stream-head (partial-sums integers) 10))

(test
 "partial sums over integers"
 '(1 3 6 10 15 21 28 36 45 55)
 sums
 'equal?
 equal?)
