(define (sqrt-improve guess x)
  (define (average x y)
    (/ (+ x y) 2))
  (average guess (/ x guess)))
