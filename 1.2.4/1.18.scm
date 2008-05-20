;;; Solutions copyright (C) 2007, Peter Danenberg; http://wizardbook.org
;;; Source code copyright (C) 1996, MIT; http://mitpress.mit.edu/sicp

(require-extension check)

(define (iter-log-* n b)
  (define (double a)
    (* 2 a))
  (define (halve a)
    (/ a 2))
  (define (iter a n b)
    (cond ((= n 0) a)
          ((even? n) (iter a (halve n) (double b)))
          (else (iter (+ a b) (- n 1) b))))
  (iter 0 n b))

(check (iter-log-* 8 8) => 64)
