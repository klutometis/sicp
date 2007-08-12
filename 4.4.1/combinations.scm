(define combinations
  '((assert! (rule (combinations ?x ())))
    (assert! (rule (combinations (?h . ?t) (?h . ?combinations))
                   (combinations ?t ?combinations)))
    (assert! (rule (combinations (?h . ?t) (?hc . ?combinations))
                   (combinations ?t (?hc . ?combinations))))))

