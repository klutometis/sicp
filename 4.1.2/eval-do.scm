;;; Solutions copyright (C) 2007, Peter Danenberg; http://wizardbook.org
;;; Source code copyright (C) 1996, MIT; http://mitpress.mit.edu/sicp

(load "do-commands.scm")
(load "do-parameter-init.scm")
(load "do-parameters.scm")
(load "do-parameter-step-omitted?.scm")
(load "do-parameter-step.scm")
(load "do-parameter-variable.scm")
(load "do-test.scm")
(load "make-definition.scm")
(load "make-assignment.scm")

(define (eval-do exp env)
  (let* ((parameters (do-parameters exp))
         (variables (map do-parameter-variable parameters))
         (inits (map do-parameter-init parameters))
         (steps (map do-parameter-step parameters))
         (test (do-test exp))
         (commands (do-commands exp)))
    (define (initialize-variables)
      (for-each
       (lambda (variable init) (eval (make-definition variable init) env))
       variables inits))
    (define (iterate values)
      (for-each
       (lambda (variable value) (eval (make-assignment variable value) env))
       variables values)
      (let ((side-effect 'false))
        (for-each (lambda (command) (set! side-effect (eval command env))) commands)
        (let ((result (eval test env)))
          (if result
              (if (null? commands)
                  result
                  side-effect)
              (iterate (map (lambda (step) (eval step env)) steps))))))
    (initialize-variables)
    (iterate inits)))

