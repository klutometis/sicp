;;; Solutions copyright (C) 2007, Peter Danenberg; http://wizardbook.org
;;; Source code copyright (C) 1996, MIT; http://mitpress.mit.edu/sicp

(require-extension check)

;; Actually: we just want an individual element, e.g.: (0, 0), (2, 1).
(define (pascal n k)
  (cond ((zero? k) 1)
        ((= n k) 1)
        (else (+ (pascal (- n 1) (- k 1)) (pascal (- n 1) k)))))

(check-reset!)
(check (pascal 4 0) => 1)
(check (pascal 4 1) => 4)
(check (pascal 4 2) => 6)
(check (pascal 4 3) => 4)
(check (pascal 4 4) => 1)
(check-report)
