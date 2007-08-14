(define (definition? exp)
  (tagged-list? exp 'define))
