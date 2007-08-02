(define (delay-it-memoized exp env)
  (list 'memoized-thunk exp env))
