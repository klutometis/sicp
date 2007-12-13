;;; Solutions copyright (C) 2007, Peter Danenberg; http://wizardbook.org
;;; Source code copyright (C) 1996, MIT; http://mitpress.mit.edu/sicp

(load "notated-parameter?.scm")
(load "notated-parameter-variable.scm")

(define (procedure-parameters p)
  (let ((notated-parameters (cadr p)))
    (map (lambda (parameter)
           (if (notated-parameter? parameter)
               (notated-parameter-variable parameter)
               parameter)) notated-parameters)))

