;;; Solutions copyright (C) 2007, Peter Danenberg; http://wizardbook.org
;;; Source code copyright (C) 1996, MIT; http://mitpress.mit.edu/sicp

(load "make-account.scm")

(define acc (make-account 100 'secret-password))
((acc 'secret-password 'withdraw) 40)
((acc 'some-other-password 'withdraw) 40)
((acc 'some-other-password 'withdraw) 40)
((acc 'some-other-password 'withdraw) 40)
((acc 'some-other-password 'withdraw) 40)
((acc 'some-other-password 'withdraw) 40)
((acc 'some-other-password 'withdraw) 40)
((acc 'some-other-password 'withdraw) 40)
((acc 'some-other-password 'withdraw) 40)
