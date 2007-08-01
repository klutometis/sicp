(load "primitive-procedure?.scm")
(load "apply-primitive-procedure.scm")
(load "compound-procedure?.scm")
(load "eval-sequence.scm")
(load "procedure-body.scm")
(load "extend-environment.scm")
(load "procedure-parameters.scm")
(load "procedure-environment.scm")
(load "list-of-arg-values.scm")
(load "list-of-delayed-args.scm")

(define (apply procedure arguments env)
  (cond ((primitive-procedure? procedure)
         (apply-primitive-procedure
          procedure
          (list-of-arg-values arguments env)))
        ((compound-procedure? procedure)
         (eval-sequence
          (procedure-body procedure)
          (extend-environment
           (procedure-parameters procedure)
           (list-of-delayed-args arguments env)
           (procedure-environment procedure))))
        (else
         (error
          "Unknown procedure type -- APPLY" procedure))))
