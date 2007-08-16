(load "amb-context.scm")
(load "amb-qeval-context.scm")
(load "query-context.scm")
(load "test-context.scm")

(install-packages)
(ambeval-global-install amb-qeval-context)

(ambeval-global
 '(define data-base (amb-qeval-make-data-base amb-qeval-microshaft)))

(define amb-job
  (ambeval-global-until-fail
   (ambeval-global '(amb-qeval '(job (? x) (? y)) data-base))))

(define sort-amb-job (sort-list amb-job))

(initialize-data-base microshaft-data-base)

(define query-job (query '(job ?x ?y)))

(define sort-query-job (sort-list query-job))

;; One not-so-subtle difference is that the two systems produce
;; results which differ in order.

(test
 "amb and query logic produce the same results (when sorted)"
 sort-amb-job
 sort-query-job
 'equal? equal?)
