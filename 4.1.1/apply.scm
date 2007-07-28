(load "primitive-procedure?.scm")
(load "apply-primitive-procedure.scm")
(load "compound-procedure?.scm")
(load "eval-sequence.scm")
(load "procedure-body.scm")
(load "extend-environmnt.scm")
(load "procedure-parameters.scm")
(load "procedure-environment.scm")

(define (apply procedure arguments)
  (cond ((primitive-procedure? procedure)
         (apply-primitive-procedure procedure arguments))
        ((compound-procedure? procedure)
         (eval-sequence
          (procedure-body procedure)
          (extend-environmnt
           (procedure-parameters procedure)
           arguments
           (procedure-environment procedure))))
        (else
         (error
          "Unknown procedure type -- APPLY" procedure))))
