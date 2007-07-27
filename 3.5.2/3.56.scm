(load "test.scm")
(load "merge.scm")
(load "scale-stream.scm")
(load "display-stream-n.scm")

(define hamming
  (cons-stream 1 (merge (scale-stream hamming 2)
                        (merge (scale-stream hamming 3)
                               (scale-stream hamming 5)))))
(define hamming-numbers (stream-head hamming 10))

(test
 "hamming numbers"
 '(1 2 3 4 5 6 8 9 10 12)
 hamming-numbers
 'equal?
 equal?
 "http://en.wikipedia.org/wiki/Hamming_numbers")
