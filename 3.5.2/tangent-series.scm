(load "mul-series.scm")
(load "invert-unit-series.scm")

(define tangent-series
  (invert-unit-series (mul-series cosine-series cosine-series)))
