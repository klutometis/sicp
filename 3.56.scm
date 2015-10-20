#!/usr/bin/env chicken-scheme
(use sicp-streams test)

(define hamming-numbers
  (cons-stream 1 (merge (scale-stream hamming-numbers 2)
                        (merge (scale-stream hamming-numbers 3)
                               (scale-stream hamming-numbers 5)))))

(test '(1 2 3 4 5 6 8 9 10 12 15 16 18 20 24 25 27 30 32 36)
      (stream->list hamming-numbers 20))
