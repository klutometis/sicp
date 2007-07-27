(define (average . terms)
  (/ (fold-right + 0 terms)
     (length terms)))
