(define (random-in-range low high)
  (let ((range (- high low)))
    (cons-stream (+ low (random range)) (random-in-range low high))))
