(load "invert-unit-series.scm")
(load "exp-series.scm")
(load "display-stream-n.scm")

(display-stream-n (invert-unit-series (invert-unit-series integers)) 10)
