(load "expand-and-clauses.scm")
(load "and-clauses.scm")

(define (and->if exp) (expand-and-clauses (and-clauses exp)))
