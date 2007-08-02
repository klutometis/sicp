;; Sans last-pair
(define (reverse l)
  (define (iter a b)
    (if (null? b)
        a
        (iter (cons (car b) a) (cdr b))))
  (iter '() l))
