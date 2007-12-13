;;; Solutions copyright (C) 2007, Peter Danenberg; http://wizardbook.org
;;; Source code copyright (C) 1996, MIT; http://mitpress.mit.edu/sicp

(define (extend-if-consistent var dat environment)
    (if (environment-bound-symbol? environment var)
        (pattern-match (environment-lookup-symbol environment var) dat environment)
        (extend var dat environment)))
