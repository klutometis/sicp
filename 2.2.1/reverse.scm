(define (reverse list)
  (define (iter a b)
    (if (null? a)
        b
        (iter (cdr a) (cons (car a) b))))
  (iter list '()))

;; Named let
(define (reverse list)
  (let iter ((a list)
             (b '()))
    (if (null? a)
        b
        (iter (cdr a) (cons (car a) b)))))
