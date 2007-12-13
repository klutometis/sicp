;;; Solutions copyright (C) 2007, Peter Danenberg; http://wizardbook.org
;;; Source code copyright (C) 1996, MIT; http://mitpress.mit.edu/sicp

;; (load "scan-out-definitions.scm")

;; (define (procedure-body p) (scan-out-definitions (caddr p)))
(define (procedure-body p) (caddr p))
