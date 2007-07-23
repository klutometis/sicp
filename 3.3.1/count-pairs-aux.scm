(define (count-pairs x)
  (define (count-pairs-iter x pairs)
    (if (not (pair? x))
        0
        (+ (count-pairs-iter (car x) (cons (car x) pairs))
           (count-pairs-iter (cdr x) (cons (car x) pairs))
           (if (memq x pairs)
               0
               1))))
  (count-pairs-iter x '()))
