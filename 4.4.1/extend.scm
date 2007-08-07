(define (extend variable value frame)
  (cons (make-binding variable value) frame))
