(load "tagged-list?.scm")

(define (definition? exp)
  (tagged-list? exp 'define))
