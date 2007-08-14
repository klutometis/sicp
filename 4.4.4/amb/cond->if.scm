(define (cond->if exp)
  (expand-clauses (cond-clauses exp)))
