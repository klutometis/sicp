;;; Solutions copyright (C) 2007, Peter Danenberg; http://wizardbook.org
;;; Source code copyright (C) 1996, MIT; http://mitpress.mit.edu/sicp

(define unique-values
  '((assert! (rule (unique-values ?elements ?unique-elements)
                   (unique-values ?elements () ?unique-elements)))
    (assert! (rule (unique-values () ?unique-elements ?unique-elements)))
    (assert! (rule (unique-values (?head . ?tail) ?accumulated ?unique-elements)
                   (or (and (member ?head ?accumulated)
                            (unique-values ?tail ?accumulated ?unique-elements))
                       (and (not (member ?head ?accumulated))
                            (unique-values ?tail (?head . ?accumulated) ?unique-elements)))))))
