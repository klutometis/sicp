(define (primitive-procedure? proc)
  (tagged-list? proc 'primitive))
