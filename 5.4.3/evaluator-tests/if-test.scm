;;; Solutions copyright (C) 2007, Peter Danenberg; http://wizardbook.org
;;; Source code copyright (C) 1996, MIT; http://mitpress.mit.edu/sicp

(define (if-test)
  (make-test
   '(if true 1)
   (lambda (value)
     (test
      "if test"
      '1
      value
      '= =))))
