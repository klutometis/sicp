;; x and y are any coprimes
(define x 7)
(define y 13)

(define (cons a b)
  (* (expt x a) (expt y b)))

(define (car n)
  (define (reduce-y n)
    (if (zero? (modulo n y))
        (reduce-y (/ n y))
        n))
  (/ (log (reduce-y n)) (log x)))

(define (cdr n)
  (define (reduce-x n)
    (if (zero? (modulo n x))
        (reduce-x (/ n x))
        n))
  (/ (log (reduce-x n)) (log y)))

(define n (cons 4 7))
(car n)
(cdr n)
