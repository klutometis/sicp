(load "tagged-list?.scm")

(define (cond? exp) (tagged-list? exp 'cond))
