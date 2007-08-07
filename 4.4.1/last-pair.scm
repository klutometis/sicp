(define last-pair
  '((assert! (rule (last-pair (?x . ()) (?x))))
    (assert! (rule (last-pair (?x . ?y) ?z) (last-pair ?y ?z)))))

