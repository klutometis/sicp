(load "integrate-series.scm")
(load "negate-stream.scm")

(define cosine-series
  (cons-stream 1 (integrate-series (negate-stream sine-series))))
