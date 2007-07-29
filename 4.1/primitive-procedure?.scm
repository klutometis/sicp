(load "tagged-list?.scm")

(define (primitive-procedure? proc)
  (tagged-list? proc 'primitive))
