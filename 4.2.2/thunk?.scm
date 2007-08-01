(load "tagged-list?.scm")

(define (thunk? obj)
  (tagged-list? obj 'thunk))
