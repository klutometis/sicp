;; Messy iterative
(define (deep-reverse tree)
  (define (iter a b)
    (cond ((null? b) a)
          ((pair? (car b)) (iter (cons (iter '() (car b)) a) (cdr b)))
          (else (iter (cons (car b) a) (cdr b)))))
  (iter '() tree))

;; More elegant Japanese solution:
(define (deep-reverse tree)
  (if (not (pair? tree))
      tree
      (reverse (map deep-reverse tree))))

(define tree '((1 2 (1 2 3 4)) (3 4)))
(deep-reverse tree)
