(load "define-variable!.scm")
(load "definition-variable.scm")
(load "definition-value.scm")

(define (eval-definition exp env)
  (define-variable! (definition-variable exp)
    (eval (definition-value exp) env)
    env)
  'ok)
