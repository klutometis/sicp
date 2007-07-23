(load "make-complex-from-real-imag.scm")
(load "type=?.scm")

(define (complex? x)
  (type=? x (make-complex-from-real-imag 1 0)))


