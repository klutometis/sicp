;;; Solutions copyright (C) 2007, Peter Danenberg; http://wizardbook.org
;;; Source code copyright (C) 1996, MIT; http://mitpress.mit.edu/sicp

(load "test-context.scm")
(load "eceval-context.scm")
;;; See ev-cond-basic.scm for monkey-patch.
(load "eceval/ev-cond-basic.scm")
(load "eceval/eceval.scm")

(define the-global-environment (setup-environment))
(define cond-result
  (eceval-global
   '(cond (false 1) ((= 1 2) 2) (else (+ 1 2)))))

(test
 "cond as basic form"
 3
 cond-result
 '= =)
