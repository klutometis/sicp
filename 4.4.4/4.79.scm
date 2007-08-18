(load "query-environment-context.scm")

(initialize-data-base microshaft-data-base)

;; (trace extend-if-consistent)
;; (load "query-context.scm")
;; (initialize-data-base microshaft-data-base)
(query '(job ?x ?y))
