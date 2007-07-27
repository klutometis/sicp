(load "test.scm")
(load "add-series.scm")
(load "mul-series.scm")
(load "trig-series.scm")

(define calculated-1
  (exact->inexact
   (reduce
    + 0 (stream-head
         (add-series (mul-series sine-series sine-series)
                     (mul-series cosine-series cosine-series)) 20))))

(test
 "sin^2 + cos^2 = 1 by mul-series"
 1.
 calculated-1
 '=
 =)
