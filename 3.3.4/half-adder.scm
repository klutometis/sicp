(load "make-wire.scm")
(load "or-gate.scm")
(load "and-gate.scm")
(load "inverter.scm")

(define (half-adder a b s c)
  (let ((d (make-wire)) (e (make-wire)))
    (or-gate a b d)
    (and-gate a b c)
    (inverter c e)
    (and-gate d e s)
    'ok))

                    
