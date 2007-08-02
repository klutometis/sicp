(define (product term a next b)
  (define (iter a result)
    (if (> a b)
        result
        (iter (next a)
              (* result (term a)))))
  (iter a 1))

(product (lambda (n) n) 1 (lambda (n) (+ n 1)) 5)
