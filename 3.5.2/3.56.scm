(load "merge.scm")
(load "scale-stream.scm")
(load "display-stream-n.scm")

(define hamming
  (cons-stream 1 (merge (scale-stream hamming 2)
                        (merge (scale-stream hamming 3)
                               (scale-stream hamming 5)))))
(display-stream-n hamming 10)
