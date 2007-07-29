(load "expand-or-clauses.scm")
(load "or-clauses.scm")

(define (or->if exp) (expand-or-clauses (or-clauses exp)))
