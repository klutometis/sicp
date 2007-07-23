(load "get.scm")

(define (make-dense-polynomial variable orders)
  ((get 'make-dense 'polynomial) variable orders))
