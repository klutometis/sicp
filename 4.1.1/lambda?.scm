(load "tagged-list?.scm")

(define (lambda? exp) (tagged-list? exp 'lambda))
