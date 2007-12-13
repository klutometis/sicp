;;; Solutions copyright (C) 2007, Peter Danenberg; http://wizardbook.org
;;; Source code copyright (C) 1996, MIT; http://mitpress.mit.edu/sicp

(define (extend-if-possible var val environment)
  (cond ((environment-bound-symbol? environment var)
         (unify-match
          (environment-lookup-symbol environment var)
          val environment))
        ((var? val)
         (if (environment-bound-symbol? environment val)
             (unify-match
              var (environment-lookup-symbol environment val)
              environment)
             (extend var val environment)))
        ((depends-on? val var environment)
         'failed)
        (else (extend var val environment))))
