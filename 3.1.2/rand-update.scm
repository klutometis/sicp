(define (rand-update x)
  (let ((a 40)
        (b 3641)
        (m 729))
    (modulo (+ (* a x) b) m)))

    
