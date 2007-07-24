(define (logical-or a b)
  (if (and (zero? a) (zero? b))
      0
      1))
