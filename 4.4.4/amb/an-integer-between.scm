(define an-integer-between
  '(define (an-integer-between low high)
     (require (>= high low))
     (amb low (an-integer-between (+ low 1) high))))
