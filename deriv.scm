;; Approximation according to f'(x) = lim h->0 (f(x + h) - f(x))/h
(define dx 0.00001)
(define (deriv g)
  (lambda (x)
    (/ (- (g (+ x dx)) (g x))
       dx)))
