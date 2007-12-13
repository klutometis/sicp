;;; Solutions copyright (C) 2007, Peter Danenberg; http://wizardbook.org
;;; Source code copyright (C) 1996, MIT; http://mitpress.mit.edu/sicp

(define (application-test)
  (make-test
   '(begin (define x 2) (+ x x))
   (lambda (value)
     (test
      "application test"
      '4
      value
      '= =))))
