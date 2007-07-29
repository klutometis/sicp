(load "the-global-environment.scm")
(load "eval.scm")

(define (eval-global exp)
  (eval exp the-global-environment))
