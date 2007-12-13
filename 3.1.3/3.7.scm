;;; Solutions copyright (C) 2007, Peter Danenberg; http://wizardbook.org
;;; Source code copyright (C) 1996, MIT; http://mitpress.mit.edu/sicp

(load "make-account.scm")
(load "make-joint.scm")

(define peter-acc (make-account 100 'open-sesame))
(define paul-acc (make-joint peter-acc 'open-sesame 'rosebud))
((peter-acc 'open-sesame 'withdraw) 50)
((paul-acc 'rosebud 'withdraw) 25)
