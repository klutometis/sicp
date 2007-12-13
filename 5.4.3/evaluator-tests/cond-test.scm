;;; Solutions copyright (C) 2007, Peter Danenberg; http://wizardbook.org
;;; Source code copyright (C) 1996, MIT; http://mitpress.mit.edu/sicp

(define (cond-test)
  (make-test
   '(cond (false 0) (else 1))
   (lambda (value)
     (test
      "cond test"
      '1
      value
      '= =))))
