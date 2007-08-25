(load "eceval-context.scm")
(load "test-context.scm")
(load "evaluator-tests-context.scm")

(define the-global-environment (setup-environment))
(run-battery test-battery eceval-global)
