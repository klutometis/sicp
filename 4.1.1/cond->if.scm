(load "expand-clauses.scm")
(load "cond-clauses.scm")

(define (cond->if exp)
  (expand-clauses (cond-clauses exp)))
