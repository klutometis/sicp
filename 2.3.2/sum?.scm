(define (sum? x)
  (and (pair? x) (eq? (car x) '+)))
