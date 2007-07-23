(load "reverse.scm")

(define l '(1 2 3 4))
(reverse l)
(equal? l (reverse (reverse l)))
