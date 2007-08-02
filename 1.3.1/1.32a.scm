(define (accumulator combiner null-value term a next b)
  (if (> a b)
      null-value
      (combiner (term a)
                (accumulator combiner null-value term (next a) next b))))

(define (sum term a next b)
  (accumulator + 0 term a next b))

(define (product term a next b)
  (accumulator * 1 term a next b))

(product (lambda (n) n) 1 (lambda (n) (+ n 1)) 5)
(sum (lambda (n) n) 1 (lambda (n) (+ n 1)) 10)
