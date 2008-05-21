(define (square x) (expt x 2))

(define (cube x) (expt x 3))

(define (average . numbers)
  (/ (apply + numbers) (length numbers)))

(define identity values)

(define pi (* 4 (atan 1)))

(define phi (/ (+ 1 (sqrt 5)) 2))
