(load "primitive-implementation.scm")

(define (apply-primitive-procedure proc args)
  ((make-primitive-procedure 'apply)
   (primitive-implementation proc) args))
