(load "get.scm")

(define (make-dense-polynomial variable orders)
  ((get 'make-dense 'dense) variable orders))
