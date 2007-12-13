;;; Solutions copyright (C) 2007, Peter Danenberg; http://wizardbook.org
;;; Source code copyright (C) 1996, MIT; http://mitpress.mit.edu/sicp

(load "query-context.scm")

(initialize-data-base microshaft-data-base)

(define unique-wizard (query '(unique (job ?x (computer wizard)))))
;; Redundancy
(define supervise-one (query '(and (supervisor ?supervisee ?supervisor)
                                   (unique (supervisor ?any-supervisee ?supervisor)))))

(test
 "unique wizard (embedded list)"
 '((unique (job (bitdiddle ben) (computer wizard))))
 unique-wizard
 'equal? equal?)

(test
 "supervise one"
 '((and (supervisor (cratchet robert) (scrooge eben)) (unique (supervisor (cratchet robert) (scrooge eben)))) (and (supervisor (reasoner louis) (hacker alyssa p)) (unique (supervisor (reasoner louis) (hacker alyssa p)))))
 supervise-one
 'equal? equal?)
