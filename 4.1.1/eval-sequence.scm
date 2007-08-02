(load "last-exp?.scm")
(load "first-exp.scm")
(load "rest-exps.scm")

(define (eval-sequence exps env)
  (cond ((last-exp? exps) (eval (first-exp exps) env))
        (else (eval (first-exp exps) env)
              (eval-sequence (rest-exps exps) env))))
