;;; Solutions copyright (C) 2007, Peter Danenberg; http://wizardbook.org
;;; Source code copyright (C) 1996, MIT; http://mitpress.mit.edu/sicp

(define (definition-test)
  (make-test
   '(begin (define x 3) x)
   (lambda (value)
     (test
      "definition test"
      '3
      value
      '= =))))
