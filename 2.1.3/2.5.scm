;;; Solutions copyright (C) 2007, Peter Danenberg; http://wizardbook.org
;;; Source code copyright (C) 1996, MIT; http://mitpress.mit.edu/sicp

(require-extension check)

;; x and y are any coprimes
(define x 7)
(define y 13)

(define (arith-cons a b)
  (* (expt x a) (expt y b)))

(define (arith-car n)
  (define (reduce-y n)
    (if (zero? (modulo n y))
        (reduce-y (/ n y))
        n))
  (/ (log (reduce-y n)) (log x)))

(define (arith-cdr n)
  (define (reduce-x n)
    (if (zero? (modulo n x))
        (reduce-x (/ n x))
        n))
  (/ (log (reduce-x n)) (log y)))

(let ((n (arith-cons 4 7)))
  (check (cons (arith-car n)
               (arith-cdr n))
         => '(4.0 . 7.0)))
