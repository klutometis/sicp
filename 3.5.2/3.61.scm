(load "invert-unit-series.scm")
(load "exp-series.scm")
(load "display-stream-n.scm")

(display-stream-n (invert-unit-series exp-series) 10)
