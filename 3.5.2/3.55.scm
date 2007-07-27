(load "test.scm")
(load "integers.scm")
(load "partial-sums.scm")

(define sums (stream-head (partial-sums integers) 10))

(test
 "partial sums over integers"
 '(1 3 6 10 15 21 28 36 45 55)
 sums
 'equal?
 equal?)
