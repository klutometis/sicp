(define (expand-or-clauses clauses)
  (if (null? clauses)
      'false
      (let ((first (car clauses))
            (rest (cdr clauses)))
        (make-if first
                 first
                 (expand-or-clauses rest)))))
