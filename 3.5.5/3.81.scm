(load "test.scm")
(load "make-random-numbers.scm")

(define random-numbers (make-random-numbers))

(define numbers (stream-head (random-numbers 'generate) 10))

(define numbers-1729 (stream-head ((random-numbers 'reset) 1729) 10))

(test
 "stream of random numbers"
 "n/a"
 numbers
 '(for-all? numbers number?)
 (lambda (null stream) (for-all? stream number?)))

(test
 "reset stream to 1729"
 '(1729 630 410 358 465 371 256 30 467 451)
 numbers-1729
 'equal?
 equal?)
