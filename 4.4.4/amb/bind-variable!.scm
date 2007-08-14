(define (bind-variable! var val frame)
  (hash-table/put! frame var val))
