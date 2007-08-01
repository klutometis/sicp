(load "analyze.scm")

(define (eval exp env)
  ((analyze exp) env))

