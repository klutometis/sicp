(load "leaf?.scm")
(load "weight-leaf.scm")

(define (weight tree)
  (if (leaf? tree)
      (weight-leaf tree)
      (cadddr tree)))
