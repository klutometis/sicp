(define (product term a next b)
  (if (> a b)
      1
      (* (term a)
         (product term (next a) next b))))

(define (factorial n)
  (product (lambda (i) i) 1 (lambda (i) (+ i 1)) n))

(factorial 5)

(define (wallis-numerator i)
  (* (+ (ceiling (/ i 2)) 1) 2))

(define (wallis-denominator i)
  (+ (* (+ (floor (/ i 2)) 1) 2) 1))

(define (wallis-pi n)
  (* 4 (/ (product wallis-numerator 0 (lambda (n) (+ 1 n)) n)
          (product wallis-denominator 0 (lambda (n) (+ 1 n)) n))))

(wallis-pi 100)
