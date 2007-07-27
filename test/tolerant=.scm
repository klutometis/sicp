(define (tolerant= x y tolerance)
  (= (round (/ x tolerance))
     (round (/ y tolerance))))
