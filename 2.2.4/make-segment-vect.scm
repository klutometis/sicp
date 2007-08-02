(load "make-vect.scm")

(define (make-segment start-x start-y end-x end-y)
  (list (make-vect start-x start-y) (make-vect end-x end-y)))
