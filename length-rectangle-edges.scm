(load "length-segment.scm")

(define (length-rectangle-edges rectangle)
  (length-segment (cdr rectangle)))
