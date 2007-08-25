(define (quoted? exp)
  (tagged-list? exp 'quote))
