(load "mul-streams.scm")
(load "integers.scm")
(load "invert-stream.scm")

(define (integrate-series series)
  (mul-streams series (invert-stream integers)))

