(load "print-point.scm")
(load "d1-rectangle-diagonal.scm")
(load "d2-rectangle-diagonal.scm")

(define (print-rectangle-diagonal rectangle)
  (print-point (d1-rectangle-diagonal rectangle))
  (print-point (d2-rectangle-diagonal rectangle)))
