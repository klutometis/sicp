(define (test-and-set! cell)
  (if (car cell)
      true
      (begin (set-car! cell true)
             false)))
