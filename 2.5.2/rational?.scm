(load "make-rational.scm")
(load "type=?.scm")

(define (rational? x)
  (type=? x (make-rational 0 1)))

