(define member
  '((assert! (rule (member ?x (?y . ?z))
                   (or (same ?x ?y)
                       (member ?x ?z))))))

