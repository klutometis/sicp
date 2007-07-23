(load "make-vect.scm")
(load "comb-vect.scm")

(define (scale-vect scalar vect)
  (let ((vectorized-scalar (make-vect scalar scalar)))
    (comb-vect vectorized-scalar vect *)))

;; (scale-vect 2 (make-vect 2 3))
