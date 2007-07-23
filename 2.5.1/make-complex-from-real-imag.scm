(load "get.scm")

(define (make-complex-from-real-imag x y)
  ((get 'make-from-real-imag 'complex) x y))
