(load "apply-in-underlying-scheme.scm")
(load "primitive-implementation.scm")

(define (apply-primitive-procedure proc args)
  (apply-in-underlying-scheme
   (primitive-implementation proc) args))
