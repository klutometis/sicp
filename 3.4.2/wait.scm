(define (wait)
  (let* ((max wait-cycles)
         (n (random max)))
    (let lp ((i 0))
      (if (< i n)
          (lp (1+ i))))))

