(define (remainder a b)
  (if (< a b)
      a
      (remainder (- a b) b)))
