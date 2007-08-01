(load "scan-out-definitions.scm")

(define (procedure-body p) (scan-out-definitions (caddr p)))
;;(define (procedure-body p) (caddr p))
