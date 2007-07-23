(define (last-pair x)
  (if (null? (cdr x))
      x
      (last-pair (cdr x))))
