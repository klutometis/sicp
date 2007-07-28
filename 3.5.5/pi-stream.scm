(load "estimate-integral.scm")
(load "unit-circle-test.scm")
(load "scale-stream.scm")

(define pi-stream
  (scale-stream (estimate-integral unit-circle-test 0 1.0 0 1.0) 4.0))
