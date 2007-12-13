;;; Solutions copyright (C) 2007, Peter Danenberg; http://wizardbook.org
;;; Source code copyright (C) 1996, MIT; http://mitpress.mit.edu/sicp

(define (self-evaluating-test)
  (make-test
   '2
   (lambda (value)
     (test
      "self-evaluating test"
      '2
      value
      '= =))))
