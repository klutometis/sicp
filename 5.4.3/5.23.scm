(load "eceval-context.scm")

(define the-global-environment (setup-environment))
(eceval-global '(begin (define x 2) (+ x x)))
