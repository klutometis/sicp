(load "center-interval.scm")
(load "width-interval.scm")

(define (percent-interval i)
  (abs (/ (width-interval i) (center-interval i))))

