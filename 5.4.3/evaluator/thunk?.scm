(define (thunk? obj)
  (tagged-list? obj 'thunk))
