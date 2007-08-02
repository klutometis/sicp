(load "put.scm")
(load "delay-it.scm")

(define (install-lazy-notation)
  (put 'lazy delay-it)
  'done)
