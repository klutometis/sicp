(define (inc n) (+ n 1))

(define (double f)
  (write-line 'doubleth)
  (lambda (x) (f (f x))))

;; Equivalent:
(((double (double double)) inc) 5)
((double (double (double (double inc)))) 5)
