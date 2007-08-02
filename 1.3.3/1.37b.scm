(define (cont-frac n d k)
  (define (iter i result)
    (cond ((zero? i)
           (iter (+ i 1) (/ (n k) (d k))))
          ((> i k) result)
          (else (iter (+ i 1) (/ (n (- k i)) (+ (d (- k i)) result))))))
  (iter 0 0.0))

(cont-frac (lambda (i) 1.0)
           (lambda (i) 1.0)
           100)

(load "test-cont-frac.scm")

(test-cont-frac (lambda (i) 1.0) (lambda (i) 1.0) 0.00001)
