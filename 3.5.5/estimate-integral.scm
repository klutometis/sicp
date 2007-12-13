;;; Solutions copyright (C) 2007, Peter Danenberg; http://wizardbook.org
;;; Source code copyright (C) 1996, MIT; http://mitpress.mit.edu/sicp

(load "random-in-range.scm")
(load "monte-carlo.scm")

(define (estimate-integral P x1 x2 y1 y2)
  (define experiment-stream
    (stream-map P (random-in-range x1 x2) (random-in-range y1 y2)))
  (monte-carlo experiment-stream 0 0))
