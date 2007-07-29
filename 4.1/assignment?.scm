(load "tagged-list?.scm")

(define (assignment? exp)
  (tagged-list? exp 'set!))
