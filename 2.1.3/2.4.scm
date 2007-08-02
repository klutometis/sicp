(define (cons x y)
  (lambda (m) (m x y)))

(define (car z)
  (z (lambda (p q) p)))

(define (cdr z)
  (z (lambda (p q) q)))

(car (cons 1 2))
(cdr (cons 1 2))

;; (car (cons x y))
;; (car (lambda (m) (m x y)))
;; ((lambda (p q) p) (x y))
;; x
