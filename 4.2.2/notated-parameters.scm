;;; Solutions copyright (C) 2007, Peter Danenberg; http://wizardbook.org
;;; Source code copyright (C) 1996, MIT; http://mitpress.mit.edu/sicp

(load "notated-parameter?.scm")

(define (notated-parameters parameters)
  (map (lambda (parameter)
         (if (notated-parameter? parameter)
             parameter
             (list parameter 'strict)))))
