(define (sum term a next b)
  (define (iter a result)
    (if (> a b)
        result
        (iter (next a) (+ result (term a)))))
  (iter a 0))

(sum (lambda (n) n) 1 (lambda (n) (+ n 1)) 10)
