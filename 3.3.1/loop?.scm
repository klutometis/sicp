(define (loop? x)
  (define (loop?-iter x visa)
    (if (pair? x)
        (if (memq x visa)
            #t
            (loop?-iter (cdr x) (cons x visa)))
        #f))
  (loop?-iter x '()))
