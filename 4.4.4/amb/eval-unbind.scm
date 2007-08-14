(define (eval-unbind exp env)
  (make-unbound! (definition-variable exp) env)
  'ok)
