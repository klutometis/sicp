(load "test.scm")
(load "trig-series.scm")
(load "display-stream-n.scm")

(define tangent-coeff (stream-head tangent-series 10))

(test
 "tangent coefficients"
 "http://en.wikipedia.org/wiki/Tangent#Power_series_of_the_tangent_function"
 '(1 0 1/3 0 2/15 0 17/315 0 62/2835 0)
 tangent-coeff
 'equal?
 equal?)
