(define (execute exp)
  (apply (eval (predicate exp) user-initial-environment)
         (args exp)))
