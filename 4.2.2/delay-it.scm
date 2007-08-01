(define (delay-it exp env)
  (list 'thunk exp env))
