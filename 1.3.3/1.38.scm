(load "cont-frac.scm")

(define (euler-e k)
  (define (n i) 1.0)
  (define (d i)
    (let ((j (- i 1)))
      (if (zero? (modulo j 3))
          (+ (* 2 (/ j 3)) 2)
          1)))
  (+ (cont-frac n d k) 2))

(euler-e 100)
