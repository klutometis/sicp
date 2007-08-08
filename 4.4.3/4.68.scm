(load "context.scm")
(load "append-to-form.scm")
;; More efficiente than reverse.scm, but still not reversible.
(load "reverse-intermediary.scm")

(initialize-data-base '())
(install append-to-form)
(install reverse-intermediary)

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

(try-kill
 (lambda () (query '(reverse ?x (1 2 3))))
 "the rules are not themselves reversible (reverse ?x (3 2 1))"
 1000)
