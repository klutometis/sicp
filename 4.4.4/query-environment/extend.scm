;;; Solutions copyright (C) 2007, Peter Danenberg; http://wizardbook.org
;;; Source code copyright (C) 1996, MIT; http://mitpress.mit.edu/sicp

(define (extend variable value environment)
  (let ((symbol (if (var? variable)
                    (variable-symbol variable)
                    variable)))
    (extend-top-level-environment
     environment
     (list symbol)
     (list value))))

