(define (add-binding-to-frame! var val frame)
  (hash-table/put! frame var val))
