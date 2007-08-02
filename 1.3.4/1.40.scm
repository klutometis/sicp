(load "newtons-method.scm")

(define (cube x) (* x x x))

(define (cubic a b c)
  (lambda (x) (+ (cube x) (* a (square x)) (* b x) c))
  )

(newtons-method (cubic 4 5 2) 1)
