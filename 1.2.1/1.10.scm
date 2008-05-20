;;; Solutions copyright (C) 2007, Peter Danenberg; http://wizardbook.org
;;; Source code copyright (C) 1996, MIT; http://mitpress.mit.edu/sicp

(require-extension check)

(define (A x y)
  (cond ((= y 0) 0)
        ((= x 0) (* 2 y))
        ((= y 1) 2)
        (else (A (- x 1)
                 (A x (- y 1))))))

(check-reset!)
(check (A 2 1) => 2)
(check (A 2 2) => 4)
(check (A 2 3) => 16)
(check (A 2 4) => 65536)
(check (A 2 5) => +inf)
(check-report)
