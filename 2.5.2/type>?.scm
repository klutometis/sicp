(load "type>=?.scm")
(load "type=?.scm")

(define (type>? x1 x2)
  (and (not (type=? x1 x2))
       (type>=? x1 x2)))
