;;; Solutions copyright (C) 2007, Peter Danenberg; http://wizardbook.org
;;; Source code copyright (C) 1996, MIT; http://mitpress.mit.edu/sicp

(require-extension check)
(require '../test/test)
(import* test
         terminate?)

(define (test-order x y) (if (= x 0) 0 y))

;; Normal order
(define (normal-p) (delay normal-p))

;; Applicative order
(define (applicative-p) (applicative-p))

(check (test-order 0 (normal-p)) => 0)
(check (terminate? (lambda () (test-order 0 (applicative-p)))) => #f)

