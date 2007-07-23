(define (fib n)
  (define (iter a b p q count)
    (cond ((= count 0) b)
          ((even? count)
           (iter a
                 b
                 (+ (square p) (square q))
                 (+ (* 2 p q) (square q))
                 (/ count 2)))
          (else (iter (+ (* b q) (* a q) (* a p))
                      (+ (* b p) (* a q))
                      p
                      q
                      (- count 1)))))
  (iter 1 0 0 1 n))

(fib 10)
