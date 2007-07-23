(load "make-interval.scm")

(define (make-center-width-interval c w)
  (make-interval (- c w) (+ c w)))
