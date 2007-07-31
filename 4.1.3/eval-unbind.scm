(load "make-unbound!.scm")
(load "definition-variable.scm")
(load "definition-value.scm")

(define (eval-unbind exp env)
  (make-unbound! (definition-variable exp) env)
  'ok)
