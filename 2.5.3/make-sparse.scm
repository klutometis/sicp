(load "get.scm")

(define (make-sparse variable orders) 
  ((get 'make-sparse 'sparse) variable orders))
