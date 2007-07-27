(define (make-tableau transform s)
  (cons-stream s
               (make-tableau transform (transform s))))
