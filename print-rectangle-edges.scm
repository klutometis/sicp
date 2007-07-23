(load "e1-rectangle-edges.scm")
(load "e2-rectangle-edges.scm")
(load "print-segment.scm")

(define (print-rectangle-edges rectangle)
  (print-segment (e1-rectangle-edges rectangle))
  (print-segment (e2-rectangle-edges rectangle)))
