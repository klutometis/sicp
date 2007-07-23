(load "get.scm")

(define (make-complex-from-mag-ang r a)
  ((get 'make-from-mag-ang 'complex) r a))
