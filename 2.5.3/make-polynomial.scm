(load "get.scm")

(define (make-polynomial var terms)
  ((get 'make 'polynomial) var terms))
