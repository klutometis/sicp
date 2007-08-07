(load "test.scm")
(load "reverse.scm")

(define orthogonal '(1 2 3 4))
(define reversal (reverse orthogonal))
(define reverse-reversal (reverse reversal))

(test
 "reversal"
 '(4 3 2 1)
 reversal
 'equal? equal?)

(test
 "reversal of the reversal"
 orthogonal
 reverse-reversal
 'equal? equal?)
