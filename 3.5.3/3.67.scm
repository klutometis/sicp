(load "pairs-symmetrical.scm")
(load "integers.scm")

(define pairs (stream-head (pairs-symmetrical integers integers) 10))

(test
 "symmetrical pairs"
 '((0 0) (0 1) (1 1) (1 0) (1 2) (0 2) (2 2) (2 0) (2 1) (0 3))
 pairs
 'equal?
 equal?)
