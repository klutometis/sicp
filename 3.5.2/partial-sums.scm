;;; Solutions copyright (C) 2007, Peter Danenberg; http://wizardbook.org
;;; Source code copyright (C) 1996, MIT; http://mitpress.mit.edu/sicp

(load "add-streams.scm")

(define (partial-sums stream)
  (cons-stream (stream-car stream)
               (add-streams (stream-cdr stream) (partial-sums stream))))
