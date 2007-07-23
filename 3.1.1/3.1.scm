(define (make-accumulator accumulatum)
  (define (accumulate accumulandum)
    (set! accumulatum (+ accumulatum accumulandum))
    accumulatum)
  accumulate)

(define A (make-accumulator 5))

(A 10)

(A 10)
