;;; Solutions copyright (C) 2007, Peter Danenberg; http://wizardbook.org
;;; Source code copyright (C) 1996, MIT; http://mitpress.mit.edu/sicp

(define zip
  '((assert! (rule (zip ?l1 ?l2 ?zipped)
                   (zip ?l1 ?l2 () ?zipped)))
    (assert! (rule (zip () () ?zipped ?zipped)))
    (assert! (rule (zip (?h1 . ?t1) (?h2 . ?t2) ?accumulated ?zipped)
                   (zip ?t1 ?t2 (?h1 . (?h2 . ?accumulated)) ?zipped)))))
