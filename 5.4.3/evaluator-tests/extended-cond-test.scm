;;; Solutions copyright (C) 2007, Peter Danenberg; http://wizardbook.org
;;; Source code copyright (C) 1996, MIT; http://mitpress.mit.edu/sicp

(define (extended-cond-test)
  (make-test
   '(cond ((assoc 'b '((a 1) (b 2))) => cadr)
          (else false))
   (lambda (value)
     (test
      "extended cond"
      2
      value
      '= =))))
