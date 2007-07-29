(load "tagged-list?.scm")

(define (application? exp) (tagged-list? exp 'call))

