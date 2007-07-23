(define (product? x)
  (and (pair? x) (eq? (car x) '*)))
