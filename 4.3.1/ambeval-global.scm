(load "the-global-environment.scm")
(load "ambeval.scm")

(define (ambeval-global exp)
  (ambeval
   exp
   the-global-environment
   (lambda (val next-alternative)
     val)
   (lambda ()
     "Ambiguous failure -- AMBEVAL")))
