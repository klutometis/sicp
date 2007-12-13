;;; Solutions copyright (C) 2007, Peter Danenberg; http://wizardbook.org
;;; Source code copyright (C) 1996, MIT; http://mitpress.mit.edu/sicp

(define (make-accumulator accumulatum)
  (define (accumulate accumulandum)
    (set! accumulatum (+ accumulatum accumulandum))
    accumulatum)
  accumulate)

(define A (make-accumulator 5))

(A 10)

(A 10)
