(define safe?
  '(define (safe? qk-i)
     (define (collides? qk qk-i i)
       (if (null? qk-i)
           false
           (if (zero? i)
               (collides? qk (cdr qk-i) 1)
               (let ((qi (car qk-i)))
                 (cond ((= qi qk) true)
                       ((= (abs (- qi qk)) i) true)
                       (else (collides? qk (cdr qk-i) (1+ i))))))))
     (if (or (null? qk-i)
             (null? (cdr qk-i)))
         true
         (if (collides? (car qk-i) qk-i 0)
             false
             (safe? (cdr qk-i))))))
