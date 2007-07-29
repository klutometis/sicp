(load "tagged-list?.scm")

(define (begin? exp) (tagged-list? exp 'begin))
