(load "center-interval.scm")
(load "percent-interval.scm")

(define (print-center-percent-interval i)
  (display (cons (center-interval i) (percent-interval i))))
