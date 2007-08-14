(define (xor->and-or exp)
  (let ((p (cadr exp))
        (q (caddr exp)))
    `(and (or ,p ,q) (not (and ,p ,q)))))
