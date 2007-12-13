;;; Solutions copyright (C) 2007, Peter Danenberg; http://wizardbook.org
;;; Source code copyright (C) 1996, MIT; http://mitpress.mit.edu/sicp

(load "notated-parameter?.scm")
(load "notated-parameter-notation.scm")

(define (parameter-notations procedure)
  (let ((parameters (cadr procedure)))
    (map (lambda (parameter)
           (if (notated-parameter? parameter)
               (notated-parameter-notation parameter)
               'strict)) parameters)))
