(load "tagged-list?.scm")

(define (evaluated-thunk? obj)
  (tagged-list? obj 'evaluated-thunk))
