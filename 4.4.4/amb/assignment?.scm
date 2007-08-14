(define (assignment? exp)
  (tagged-list? exp 'set!))
