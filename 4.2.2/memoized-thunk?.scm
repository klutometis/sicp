(load "tagged-list?.scm")

(define (memoized-thunk? obj)
  (tagged-list? obj 'memoized-thunk))
