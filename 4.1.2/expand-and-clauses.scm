(load "make-if.scm")

(define (expand-and-clauses clauses)
  (if (null? clauses)                   ; empty and-clause
      'true
      (let ((first (car clauses))
            (rest (cdr clauses)))
        (make-if first
                 (if (null? rest)
                     first
                     (expand-and-clauses rest))
                 'false))))
