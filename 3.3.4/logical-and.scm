(define (logical-and a b)
  (if (zero? a)
      0
      (if (zero? b)
          0
          1)))
