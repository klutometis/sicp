(define (equal-rat? x y)
  (= (* (numer x) (denom y))
     (* (numer y) (denom x))))
