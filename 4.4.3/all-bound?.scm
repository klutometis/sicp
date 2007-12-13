;;; Solutions copyright (C) 2007, Peter Danenberg; http://wizardbook.org
;;; Source code copyright (C) 1996, MIT; http://mitpress.mit.edu/sicp

(define (all-bound? bindings frame)
  (if (null? bindings)
      true
      (let ((binding (car bindings)))
        (let loop-vars ((vars binding))
          (if (null? vars)
              (all-bound? (cdr bindings) frame)
              (let ((var (car vars)))
                (if (var? var)
                    (let ((association (assoc var frame)))
                      (if association
                          (loop-vars (cdr vars))
                          false))
                    (loop-vars (cdr vars)))))))))
