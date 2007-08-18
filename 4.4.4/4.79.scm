(define (non-rule-query)
  (query '(job ?x ?y)))

(define (rule-query)
  (query '(lives-near ?x ?y)))

(load "query-environment-context.scm")
(initialize-data-base microshaft-data-base)

(define environment-non-rule-query
  (non-rule-query))

(define environment-rule-query
  (rule-query))

(load "query-context.scm")
(initialize-data-base microshaft-data-base)

(define frame-non-rule-query
  (non-rule-query))

(define frame-rule-query
  (rule-query))

(test
 "environment- and frame-non-rule-queries are the same"
 frame-non-rule-query
 environment-non-rule-query
 'equal? equal?)

(test
 "environment- and frame-rule-queries are the same"
 frame-rule-query
 environment-rule-query
 'equal? equal?)

