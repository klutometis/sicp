(load "make-vect.scm")
(load "transform-painter.scm")

(define (rotate180 painter)
  (transform-painter painter
                     (make-vect 1. 1.)
                     (make-vect 0. 1.)
                     (make-vect 1. 0.)))
