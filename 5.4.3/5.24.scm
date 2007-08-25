(load "eceval-context.scm")
;;; See ev-cond-basic.scm for monkey-patch.
(load "eceval/ev-cond-basic.scm")
(load "eceval/eceval.scm")

(define the-global-environment (setup-environment))
(eceval-global
 '(cond (false 1) ((= 1 2) 2) (else (+ 1 2))))
