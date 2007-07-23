(load "apply-generic.scm")
(load "put-irreducible.scm")

(define (project x)
  (put-irreducible 'project)
  (apply-generic 'project x))
