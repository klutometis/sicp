(load "test.scm")
(load "invert-unit-series.scm")
(load "exp-series.scm")
(load "display-stream-n.scm")

(define reinverted-series
  (stream-head (invert-unit-series (invert-unit-series exp-series)) 10))

(test
 "reinverted exp-series"
 (stream-head exp-series 10)
 reinverted-series
 equal?)

