(load "register-machine-context.scm")
(load "test-context.scm")

(define make-label-operator
  (lambda ()
    (make-machine
     '()
     `((eq? ,eq?))
     '(test-label
       (test (op eq?) (label test-label) (label test-label))))))

(define label-op-no-error true)

(bind-condition-handler
 '()
 (lambda (condition) (set! label-op-no-error false))
 (lambda () (start (make-label-operator))))

(load "register-machine/make-operation-exp-labels-registers.scm")

(define label-op-error false)

(bind-condition-handler
 '()
 (lambda (condition) (set! label-op-error true))
 (lambda () (start (make-label-operator))))

(test
 "no error on label operations before change; error thereafter"
 label-op-no-error
 label-op-error
 'eq? eq?)
