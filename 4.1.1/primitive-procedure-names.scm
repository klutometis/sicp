(load "primitive-procedures.scm")

(define (primitive-procedure-names)
  (map car
       primitive-procedures))
