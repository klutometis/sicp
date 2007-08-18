(define (extend variable value environment)
  (let ((symbol (if (var? variable)
                    (variable-symbol variable)
                    variable)))
    (extend-top-level-environment
     environment
     (list symbol)
     (list value))))

