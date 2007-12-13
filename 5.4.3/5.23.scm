;;; Solutions copyright (C) 2007, Peter Danenberg; http://wizardbook.org
;;; Source code copyright (C) 1996, MIT; http://mitpress.mit.edu/sicp

(load "eceval-context.scm")
(load "test-context.scm")
(load "evaluator-tests-context.scm")

(define the-global-environment (setup-environment))
(run-battery test-battery eceval-global)
