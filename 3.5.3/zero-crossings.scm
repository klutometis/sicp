;;; Solutions copyright (C) 2007, Peter Danenberg; http://wizardbook.org
;;; Source code copyright (C) 1996, MIT; http://mitpress.mit.edu/sicp

(load "sign-change-detector.scm")

(define (zero-crossings sense-data)
  (stream-map sign-change-detector sense-data (stream-cdr sense-data)))
