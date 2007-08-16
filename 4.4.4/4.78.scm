(load "amb-context.scm")
(load "amb-qeval-context.scm")

(install-packages)
(ambeval-global-install amb-qeval-context)

(ambeval-global
 '(define data-base (amb-qeval-make-data-base amb-qeval-microshaft)))
(amb-qeval-global-until-fail '(amb-qeval '(job (? x) (? y)) data-base))
