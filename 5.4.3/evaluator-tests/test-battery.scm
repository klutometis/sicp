;;; Solutions copyright (C) 2007, Peter Danenberg; http://wizardbook.org
;;; Source code copyright (C) 1996, MIT; http://mitpress.mit.edu/sicp

(define test-battery
  (list
   (and-test)
   (application-test)
   (assignment-test)
   (cond-test)
   (definition-test)
   (if-test)
   (let-test)
   (named-let-test)
   (or-test)
   (self-evaluating-test)))
