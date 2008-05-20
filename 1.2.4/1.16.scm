;;; Solutions copyright (C) 2007, Peter Danenberg; http://wizardbook.org
;;; Source code copyright (C) 1996, MIT; http://mitpress.mit.edu/sicp

(require-extension check)
(require '../test/test)
(require '../util/util)
(import* test approx?)
(import* util square)

(define (exp b n)
  (define (iter a b n)
    (cond ((= n 0) a)
          ((even? n) (iter a (square b) (/ n 2)))
          (else (iter (* a b) b (- n 1)))))
    (iter 1 b n))

(check (/ (exp 2 1000) 10e+301) (=> approx?) 0.10715)
