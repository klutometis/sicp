(define (average-damp f)
  (lambda (x) (average x (f x))))
