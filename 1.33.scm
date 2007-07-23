(load "smallest-divisor.scm")

(define (filtered-accumulate filter? combiner null-value term a next b)
  (if (> a b)
      null-value
      (let ((combinandum (if (filter? a) (term a) null-value)))
        (combiner combinandum
                  (filtered-accumulate filter? combiner null-value term (next a) next b)))))

(define (sum filter? term a next b)
  (filtered-accumulate filter? + 0 term a next b))

(define (product filter? term a next b)
  (filtered-accumulate filter? * 1 term a next b))

;; Sigma {even numbers in 1-10}
;; (sum (lambda (n) (even? n)) (lambda (n) n) 1 (lambda (n) (+ n 1)) 10)

(define (sum-primes a b)
  (sum prime? (lambda (n) n) a (lambda (n) (+ n 1)) b))

(sum-primes 1 10)

(define (product-relative-primes n)
  (product (lambda (m) (= (gcd m n) 1)) (lambda (n) n) 1 (lambda (n) (+ n 1)) n))

(product-relative-primes 10)
