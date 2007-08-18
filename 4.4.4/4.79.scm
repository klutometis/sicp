(load "query-environment-context.scm")

(initialize-data-base microshaft-data-base)

(define (non-rule-query)
  (query '(job ?x ?y)))

(define (rule-query)
  (query '(lives-near ?x ?y)))

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

;; See:
;; 
;; query-environment/apply-a-rule.scm
;; query-environment/apply-rules.scm
;; query-environment/check-an-assertion.scm
;; query-environment/conjoin.scm query-environment/depends-on?.scm
;; environment-bound-symbol?.scm environment-lookup-symbol.scm
;; query-environment/extend-if-consistent.scm
;; query-environment/extend-if-possible.scm
;; query-environment/extend.scm query-environment/fetch-assertions.scm
;; query-environment/fetch-rules.scm
;; query-environment/find-assertions.scm
;; query-environment/instantiate.scm make-environment.scm
;; query-environment/pattern-match.scm query-environment/qeval.scm
;; query-environment/query.scm query-environment/simple-query.scm
;; query-environment/unify-match.scm variable-symbol.scm
;; 
;; for changes.
