(define ev-if
  '(ev-if
;;     (perform (op write-line) (const '***************))
;;     (perform (op write-line) (reg exp))
    (save exp)
    (save env)
    (save continue)
    (assign continue (label ev-if-decide))
    (assign exp (op if-predicate) (reg exp))
    (goto (label actual-value))
;    (goto (label eval-dispatch))
    ))
