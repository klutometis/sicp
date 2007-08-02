(load "transform-painter.scm")

(define (identity painter)
  (transform-painter painter
                     (make-vect 0. 0.)
                     (make-vect 1. 0.)
                     (make-vect 0. 1.)))

