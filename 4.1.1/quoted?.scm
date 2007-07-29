(load "tagged-list?.scm")

(define (quoted? exp)
  (tagged-list? exp 'quote))
