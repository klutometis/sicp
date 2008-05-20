;;; Solutions copyright (C) 2007, Peter Danenberg; http://wizardbook.org
;;; Source code copyright (C) 1996, MIT; http://mitpress.mit.edu/sicp

(require-extension check)

(define (accumulator combiner null-value term a next b)
  (if (> a b)
      null-value
      (combiner (term a)
                (accumulator combiner null-value term (next a) next b))))

(define (sum term a next b)
  (accumulator + 0 term a next b))

(define (product term a next b)
  (accumulator * 1 term a next b))

(check (product (lambda (n) n) 1 (lambda (n) (+ n 1)) 5) => 120)
(check (sum (lambda (n) n) 1 (lambda (n) (+ n 1)) 10) => 55)
