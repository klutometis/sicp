;;; Solutions copyright (C) 2007, Peter Danenberg; http://wizardbook.org
;;; Source code copyright (C) 1996, MIT; http://mitpress.mit.edu/sicp

(define combinations
  '((assert! (rule (combinations ?x ())))
    (assert! (rule (combinations (?h . ?t) (?h . ?combinations))
                   (combinations ?t ?combinations)))
    (assert! (rule (combinations (?h . ?t) (?hc . ?combinations))
                   (combinations ?t (?hc . ?combinations))))))

