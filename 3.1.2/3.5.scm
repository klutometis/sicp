(load "estimate-integral.scm")
(load "unit-circle-test.scm")

;; Test quadrant I, multiply by four.
(* 4.0 (estimate-integral unit-circle-test 0 1.0 0 1.0 10000))
