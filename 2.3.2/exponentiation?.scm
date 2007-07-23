(define (exponentiation? x)
  (and (pair? x) (eq? (car x) '**)))
