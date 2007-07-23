(load "cesaro-test.scm")

(define (estimate-pi trials)
  (sqrt (/ 6 (monte-carlo trials cesaro-test))))
