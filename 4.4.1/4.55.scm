;;; Solutions copyright (C) 2007, Peter Danenberg; http://wizardbook.org
;;; Source code copyright (C) 1996, MIT; http://mitpress.mit.edu/sicp

(load "context.scm")

(initialize-data-base microshaft-data-base)
(define supervisees (query '(supervisor ?x (Bitdiddle Ben))))
(define accountants (query '(job ?x (accounting . ?y))))
(define slumerville-ites (query '(address ?x (Slumerville . ?y))))

(test
 "ben's supervisees"
 '((supervisor (tweakit lem e) (bitdiddle ben)) (supervisor (fect cy d) (bitdiddle ben)) (supervisor (hacker alyssa p) (bitdiddle ben)))
 supervisees
 'equal? equal?)

(test
 "accountants"
 '((job (cratchet robert) (accounting scrivener)) (job (scrooge eben) (accounting chief accountant)))
 accountants
 'equal? equal?)

(test
 "slumerville-ites"
 '((address (aull dewitt) (slumerville (onion square) 5)) (address (reasoner louis) (slumerville (pine tree road) 80)) (address (bitdiddle ben) (slumerville (ridge road) 10)))
 slumerville-ites
 'equal? equal?)
