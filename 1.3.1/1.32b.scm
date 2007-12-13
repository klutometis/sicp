;;; Solutions copyright (C) 2007, Peter Danenberg; http://wizardbook.org
;;; Source code copyright (C) 1996, MIT; http://mitpress.mit.edu/sicp

(define (accumulator combiner null-value term a next b)
  (define (iter a result)
    (if (> a b)
        result
        (iter (next a)
              (combiner result (term a)))))
  (iter a null-value))

(define (sum term a next b)
  (accumulator + 0 term a next b))

(define (product term a next b)
  (accumulator * 1 term a next b))

(product (lambda (n) n) 1 (lambda (n) (+ n 1)) 5)
(sum (lambda (n) n) 1 (lambda (n) (+ n 1)) 10)
