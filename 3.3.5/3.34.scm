(load "make-connector.scm")
(load "averager.scm")
(load "probe.scm")
(load "set-value!.scm")
(load "multiplier.scm")

(define (squarer a b)
  (multiplier a a b))

(define a (make-connector))
(define b (make-connector))

(squarer a b)

(probe 'a a)
(probe 'b b)

(set-value! b 4 'user)

;; The squarer only works in one direction (a -> b); could it be that
;; there is no equality constraint between a and a from the other
;; direction?

;; Also, there is no providence for square-roots of negatives (either
;; by error, or a new imaginary class).
