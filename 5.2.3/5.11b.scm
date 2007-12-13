;;; Solutions copyright (C) 2007, Peter Danenberg; http://wizardbook.org
;;; Source code copyright (C) 1996, MIT; http://mitpress.mit.edu/sicp

(load "register-machine-context.scm")
(load "test-context.scm")

(define make-incongruous-restore
  (lambda ()
    (make-machine
     '(y x)
     '()
     '((assign x (const 1))
       (assign y (const 2))
       (save y)
       (save x)
       (restore y)))))

(define result-machine (make-incongruous-restore))
(start result-machine)
(define result
  (list (get-register-contents result-machine 'x)
        (get-register-contents result-machine 'y)))

(load "register-machine/make-restore-last.scm")
(load "register-machine/make-save-last.scm")

(define erratum
  (ignore-errors (lambda () (start (make-incongruous-restore)))))

(test
 "old version results"
 '(1 1)
 result
 'equal? equal?)

(test
 "new version errs"
 "#[condition n simple-error]"
 erratum
 'condition? (lambda (n/a erratum) (condition? erratum)))
