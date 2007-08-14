(load "context.scm")

(initialize-data-base microshaft-data-base)
(query '(assert! (rule (supervises-a-non-programmer ?y)
                       (and (supervisor ?x ?y)
                            (not (job ?x (computer programmer)))))))
(define original-negation
  (query '(supervises-a-non-programmer ?x)))

;; See here for fix.
(load "negate-delay.scm")
(load "extend-if-consistent-negate-delay.scm")

(initialize-data-base microshaft-data-base)
(query '(assert! (rule (supervises-a-non-programmer ?y)
                       (and (not (job ?x (computer programmer)))
                            (supervisor ?x ?y)))))
(define delayed-negation
  (query '(supervises-a-non-programmer ?x)))

(test
 "original negation and inverted, delayed negation produce the same results"
 original-negation
 delayed-negation
 'equal? equal?)

