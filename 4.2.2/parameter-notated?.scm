;;; Solutions copyright (C) 2007, Peter Danenberg; http://wizardbook.org
;;; Source code copyright (C) 1996, MIT; http://mitpress.mit.edu/sicp

(load "notated-parameter-notation.scm")

(define (parameter-notated? parameter notation)
  (eq? (notated-parameter-notation parameter) notation))

