(load "test.scm")
(load "last-pair.scm")

(define last-pair (last-pair '(1 2 3 4)))

(test
 "last pair"
 '(4)
 last-pair
 'equal? equal?)
