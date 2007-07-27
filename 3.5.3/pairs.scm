(load "interleave.scm")
(load "generalized-pairs.scm")

(define (pairs s t)
  (generalized-pairs s t interleave))
