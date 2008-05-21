;;; Solutions copyright (C) 2007, Peter Danenberg; http://wizardbook.org
;;; Source code copyright (C) 1996, MIT; http://mitpress.mit.edu/sicp

(require-extension check)

(define (inc n) (+ n 1))

(define (double f)
  (lambda (x) (f (f x))))

;; Equivalent:
(check (((double (double double)) inc) 5) => 21)

