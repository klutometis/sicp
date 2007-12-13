;;; Solutions copyright (C) 2007, Peter Danenberg; http://wizardbook.org
;;; Source code copyright (C) 1996, MIT; http://mitpress.mit.edu/sicp

(load "query-context.scm")

(define (run-query)
  (initialize-data-base microshaft-data-base)
  (query '(and (supervisor ?middle-manager (warbucks oliver))
               (supervisor ?x ?middle-manager))))

(define N^2/k-conjunction (run-query))

(load "query/conjoin-k.scm")

(define N^2/k^2-conjunction (run-query))

(test
 "N^2/k and new N^2/k^2 conjunction give the same results"
 N^2/k-conjunction
 N^2/k^2-conjunction
 'equal? equal?)
