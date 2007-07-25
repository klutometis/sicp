(load "make-connector.scm")
(load "adder.scm")

(define (c- x y)
  (let ((z (make-connector)))
    (adder y z x)
    z))
