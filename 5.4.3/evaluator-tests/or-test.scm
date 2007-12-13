;;; Solutions copyright (C) 2007, Peter Danenberg; http://wizardbook.org
;;; Source code copyright (C) 1996, MIT; http://mitpress.mit.edu/sicp

(define (or-test)
  (make-test
   '(or false false (or false true))
   (lambda (value)
     (test
      "or test"
      '#t
      value
      'eq? eq?))))
