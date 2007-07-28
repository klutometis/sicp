(load "tagged-list?.scm")

(define (compound-procedure? p)
  (tagged-list? p 'procedure))
