(define (unbind-variable! var frame)
  (hash-table/remove! frame var))
