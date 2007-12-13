;;; Solutions copyright (C) 2007, Peter Danenberg; http://wizardbook.org
;;; Source code copyright (C) 1996, MIT; http://mitpress.mit.edu/sicp

(load "primitive-procedure?.scm")
(load "apply-primitive-procedure.scm")
(load "compound-procedure?.scm")
(load "eval-sequence.scm")
(load "procedure-body.scm")
(load "extend-environment.scm")
(load "procedure-parameters.scm")
(load "procedure-environment.scm")
(load "list-of-arg-values.scm")
(load "list-of-notated-args.scm")
(load "parameter-notations.scm")

(define (apply procedure arguments env)
  (cond ((primitive-procedure? procedure)
         (apply-primitive-procedure
          procedure
          (list-of-arg-values arguments env)))
        ((compound-procedure? procedure)
         (let* ((parameters (procedure-parameters procedure))
                (notations (parameter-notations procedure)))
           (eval-sequence
            (procedure-body procedure)
            (extend-environment
             parameters
             (list-of-notated-args arguments notations env)
             (procedure-environment procedure)))))
        (else
         (error
          "Unknown procedure type -- APPLY" procedure))))
