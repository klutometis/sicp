;;; Solutions copyright (C) 2007, Peter Danenberg; http://wizardbook.org
;;; Source code copyright (C) 1996, MIT; http://mitpress.mit.edu/sicp

(require-extension check)

(define (remainder a b)
  (if (< a b)
      a
      (remainder (- a b) b)))

(define (gcd a b)
  (if (zero? b)
      a
      (gcd b (remainder a b))))

;; Seems to work for this example, but the theory is shaky:
;; Build up opaque metavariables; and add their degree.
;; Is there a pathological mixture of applicative evaluation?
(define alpha (remainder 206 40))
(define beta (remainder 40 alpha))
(define gamma (remainder alpha beta))
(define delta (remainder beta gamma))

;; The degree of delta is seven; gamma, four.  The evaluation
;; of delta results in eighteen remainders (the answer).
(check (gcd gamma delta) => 2)
