(define (compiled-procedure? proc)
  (tagged-list? proc 'compiled-procedure))
