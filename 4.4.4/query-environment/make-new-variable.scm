;;; Solutions copyright (C) 2007, Peter Danenberg; http://wizardbook.org
;;; Source code copyright (C) 1996, MIT; http://mitpress.mit.edu/sicp

(define (make-new-variable var rule-application-id)
  (cons '? (cons rule-application-id (cdr var))))
