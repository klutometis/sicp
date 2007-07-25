(load "make-connector.scm")
(load "multiplier.scm")

(define (c* x y)
  (let ((z (make-connector)))
    (multiplier x y z)
    z))
