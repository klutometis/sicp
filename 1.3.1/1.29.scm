(load "sum.scm")

(define (cube x) (* x x x))

(define (simpsons f a b n)
  (define (coefficient i)
    (cond ((or (zero? i) (= n i)) 1)
          ((even? i) 2)
          (else 4)))
  (define interval (/ (- b a) n))
  (define (term i)
    (* (coefficient i) (f (+ a (* i interval)))))
  (* (/ interval 3) (sum term a (lambda (i) (+ i 1)) n)))

(simpsons (lambda (x) (/ 1 (+ 1 (square x)))) 0 1 100)
(simpsons square 2 5 100)
(simpsons square 2 5 1000)
(simpsons cube 0 1 100)
