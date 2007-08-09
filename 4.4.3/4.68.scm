(load "context.scm")
(load "append-to-form.scm")
;; More efficiente than reverse.scm, but still not reversible.
(load "reverse-accumulate.scm")

(initialize-data-base '())
(install append-to-form)
(install reverse-accumulate)

(define reversed (query '(reverse (1 2 3) ?x)))
(define reversed-reversed (query `(reverse ,(caddr (car reversed)) ?x)))

(test
 "reversed sequence"
 '((reverse (1 2 3) (3 2 1)))
 reversed
 'equal? equal?)

(test
 "reversed reversed"
 '((reverse (3 2 1) (1 2 3)))
 reversed-reversed
 'equal? equal?)

;; See http://www.cs.sunysb.edu/~warren/xsbbook/node12.html for a
;; possible accumulator fix.
(try-kill
 (lambda () (query '(reverse ?x (1 2 3))))
 "the rules are not themselves reversible (reverse ?x (3 2 1))"
 1000)
