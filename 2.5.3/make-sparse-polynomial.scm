(load "get.scm")

(define (make-sparse-polynomial variable orders)
  ((get 'make-sparse 'polynomial) variable orders))
