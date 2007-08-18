;; The book seems to constrain conjunctions to two-clauses: ". . . the
;; two clauses of the and."

;; Generalized to n clauses.
(define (conjoin conjuncts frame-stream)
  (if (empty-conjunction? conjuncts)
      frame-stream
      (let ((qevals (map (lambda (conjunct) (qeval conjunct frame-stream)) conjuncts)))
        (stream-filter
         (lambda (qeval) (not (eq? qeval 'failed)))
         (stream-map combine (n-ary-cartesian qevals))))))
