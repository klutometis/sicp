;;; Solutions copyright (C) 2007, Peter Danenberg; http://wizardbook.org
;;; Source code copyright (C) 1996, MIT; http://mitpress.mit.edu/sicp

(define append-to-form
  '((assert! (rule (append-to-form () ?y ?y)))
    (assert! (rule (append-to-form (?u . ?v) ?y (?u . ?z))
                   (append-to-form ?v ?y ?z)))))
