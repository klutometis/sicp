;;; Solutions copyright (C) 2007, Peter Danenberg; http://wizardbook.org
;;; Source code copyright (C) 1996, MIT; http://mitpress.mit.edu/sicp

(load "put.scm")
(load "assignment-variable.scm")
(load "assignment-value.scm")
(load "set-variable-value!.scm")
(load "analyze.scm")

(define (install-assignment-package)
  (define (analyze-assignment exp)
    (let ((var (assignment-variable exp))
          (vproc (analyze (assignment-value exp))))
      (lambda (env)
        (set-variable-value! var (vproc env) env)
        'ok)))
  (put 'set! analyze-assignment)
  'done)
