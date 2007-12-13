;;; Solutions copyright (C) 2007, Peter Danenberg; http://wizardbook.org
;;; Source code copyright (C) 1996, MIT; http://mitpress.mit.edu/sicp

(load "cesaro-test.scm")

(define (estimate-pi trials)
  (sqrt (/ 6 (monte-carlo trials cesaro-test))))
