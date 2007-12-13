;;; Solutions copyright (C) 2007, Peter Danenberg; http://wizardbook.org
;;; Source code copyright (C) 1996, MIT; http://mitpress.mit.edu/sicp

(define (ambeval-global exp)
  (ambeval
   exp
   the-global-environment
   (lambda (val next-alternative)
     val)
   (lambda ()
     "Ambiguous failure -- AMBEVAL")))
