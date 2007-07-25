(load "make-connector.scm")
(load "adder.scm")

(define (c+ x y)
  (let ((z (make-connector)))
    (adder x y z)
    z))
