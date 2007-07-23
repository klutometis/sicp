(load "get.scm")

(define (make-scheme-number n)
  ((get 'make 'scheme-number) n))
