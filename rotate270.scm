(load "make-vect.scm")
(load "transform-painter.scm")

(define (rotate270 painter)
  (transform-painter painter
                     (make-vect 0. 1.)
                     (make-vect 0. 0.)
                     (make-vect 1. 1.)))
