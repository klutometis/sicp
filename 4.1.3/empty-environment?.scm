(load "the-empty-environment.scm")

(define (empty-environment? env) (eq? env the-empty-environment))
