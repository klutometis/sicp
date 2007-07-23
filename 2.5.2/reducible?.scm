(load "irreducible?.scm")

(define (reducible? op)
  (not (irreducible? op)))
