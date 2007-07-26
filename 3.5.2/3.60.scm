(load "add-series.scm")
(load "mul-series.scm")
(load "trig-series.scm")

(exact->inexact
 (reduce
  + 0 (stream-head (add-series (mul-series sine-series sine-series)
                               (mul-series cosine-series cosine-series)) 20)))
