(define (rule? statement)
  (tagged-list? statement 'rule))
