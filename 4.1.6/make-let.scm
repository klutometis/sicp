(define (make-let bindings body)
  (append (list 'let bindings) body))
