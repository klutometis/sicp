(load "print-point.scm")

(define (print-segment segment)
  (print-point (start-segment segment))
  (print-point (end-segment segment)))
