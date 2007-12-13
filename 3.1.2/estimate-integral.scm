;;; Solutions copyright (C) 2007, Peter Danenberg; http://wizardbook.org
;;; Source code copyright (C) 1996, MIT; http://mitpress.mit.edu/sicp

(load "monte-carlo.scm")
(load "random-in-range.scm")

(define (estimate-integral P x1 x2 y1 y2 trials)
  (monte-carlo trials (lambda () (P (random-in-range x1 x2)
                                    (random-in-range y1 y2)))))
