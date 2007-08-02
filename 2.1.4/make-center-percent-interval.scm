(load "make-center-width-interval.scm")

(define (make-center-percent-interval c p)
  (let ((width (* c p)))
    (make-center-width-interval c width)))
