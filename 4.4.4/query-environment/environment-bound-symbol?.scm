;;; Solutions copyright (C) 2007, Peter Danenberg; http://wizardbook.org
;;; Source code copyright (C) 1996, MIT; http://mitpress.mit.edu/sicp

(define (environment-bound-symbol? environment var)
  (let ((symbol (if (var? var)
                    (variable-symbol var)
                    var)))
    (environment-bound? environment symbol)))
