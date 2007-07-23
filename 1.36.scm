(load "fixed-point.scm")

(fixed-point (lambda (x) (/ (log 1000) (log x))) 10.0)
(fixed-point (lambda (x) (average x (/ (log 1000) (log x)))) 10.0)

;; 32 vs. 9 steps; 400%.
