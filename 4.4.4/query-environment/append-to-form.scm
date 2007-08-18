(define append-to-form
  '((assert! (rule (append-to-form () ?y ?y)))
    (assert! (rule (append-to-form (?u . ?v) ?y (?u . ?z))
                   (append-to-form ?v ?y ?z)))))
