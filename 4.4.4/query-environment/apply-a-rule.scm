;;; Solutions copyright (C) 2007, Peter Danenberg; http://wizardbook.org
;;; Source code copyright (C) 1996, MIT; http://mitpress.mit.edu/sicp

(define (apply-a-rule rule query-pattern query-environment)
  (let ((unify-result
         (unify-match query-pattern
                      (conclusion rule)
                      (extend-top-level-environment query-environment))))
    (if (eq? unify-result 'failed)
        the-empty-stream
        (qeval (rule-body rule)
               (singleton-stream unify-result)))))
