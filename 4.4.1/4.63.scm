;;; Solutions copyright (C) 2007, Peter Danenberg; http://wizardbook.org
;;; Source code copyright (C) 1996, MIT; http://mitpress.mit.edu/sicp

(load "context.scm")
(load "genealogy.scm")

(initialize-data-base '())
(install genealogy)

(define grandsons-cain (query '(grandson cain ?s)))
(define sons-lamech (query '(son lamech ?s)))
(define grandsons-methushael (query '(grandson methushael ?s)))

(test
 "grandsons of cain"
 '((grandson cain irad))
 grandsons-cain
 'equal? equal?)

(test
 "sons of lamech"
 '((son lamech jubal) (son lamech jabal))
 sons-lamech
 'equal? equal?)

(test
 "grandsons of methushael"
 '((grandson methushael jubal) (grandson methushael jabal))
 grandsons-methushael
 'equal? equal?)
