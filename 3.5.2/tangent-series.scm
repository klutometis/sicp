(load "mul-series.scm")
(load "invert-unit-series.scm")
(load "integrate-series.scm")

;; Didn't use div-series.
(define tangent-series
  (integrate-series (invert-unit-series (mul-series cosine-series cosine-series))))
