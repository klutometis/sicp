(load "transform-painter.scm")
(load "make-vect.scm")

(define (rotate90 painter)
  (transform-painter painter
                     (make-vect 1. 0.)
                     (make-vect 1. 1.)
                     (make-vect 0. 0.)))
