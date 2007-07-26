(load "mul-series.scm")
(load "invert-unit-series.scm")

(define (div-series s1 s2)
  (if (zero? (stream-car s2))
      (error "Divide by zero -- DIV-SERIES")
      (mul-series s1 (invert-unit-series s2))))

