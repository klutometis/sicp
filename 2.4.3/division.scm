(define (division object)
  (if (port? object)
      (read object)
      (car object)))
