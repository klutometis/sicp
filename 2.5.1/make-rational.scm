(load "get.scm")

(define (make-rational n d)
  ((get 'make 'rational) n d))
