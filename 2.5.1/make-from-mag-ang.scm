(load "get.scm")

(define (make-from-mag-ang r a)
  ((get 'make-from-mag-ang 'polar) r a))
