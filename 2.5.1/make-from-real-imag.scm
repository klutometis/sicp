(load "get.scm")

(define (make-from-real-imag x y)
  ((get 'make-from-real-imag 'rectangular) x y))
