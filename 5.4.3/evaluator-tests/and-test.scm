;;; Solutions copyright (C) 2007, Peter Danenberg; http://wizardbook.org
;;; Source code copyright (C) 1996, MIT; http://mitpress.mit.edu/sicp

(define (and-test)
  (make-test
   '(and true true (and false 1))
   (lambda (value)
     (test
      "and test"
      '#f
      value
      'eq? eq?))))
