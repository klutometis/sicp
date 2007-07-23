(load "type>?.scm")

(define (type<? x1 x2)
  (not (type>? x1 x2)))
