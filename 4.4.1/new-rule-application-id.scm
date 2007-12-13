;;; Solutions copyright (C) 2007, Peter Danenberg; http://wizardbook.org
;;; Source code copyright (C) 1996, MIT; http://mitpress.mit.edu/sicp

(define (new-rule-application-id)
  (set! rule-counter (+ 1 rule-counter))
  rule-counter)
