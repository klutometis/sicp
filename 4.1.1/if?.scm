(load "tagged-list?.scm")

(define (if? exp) (tagged-list? exp 'if))
