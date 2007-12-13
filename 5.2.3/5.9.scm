;;; Solutions copyright (C) 2007, Peter Danenberg; http://wizardbook.org
;;; Source code copyright (C) 1996, MIT; http://mitpress.mit.edu/sicp

(load "register-machine-context.scm")
(load "test-context.scm")

(define make-label-operator
  (lambda ()
    (make-machine
     '()
     `((eq? ,eq?))
     '(test-label
       (test (op eq?) (label test-label) (label test-label))))))

(define label-op-no-error
  (not (condition? (ignore-errors (lambda () (start (make-label-operator)))))))

(load "register-machine/make-operation-exp-labels-registers.scm")

(define label-op-error
  (condition? (ignore-errors (lambda () (start (make-label-operator))))))

(test
 "no errors on label operations before change; but errors thereafter"
 label-op-no-error
 label-op-error
 'eq? eq?)
