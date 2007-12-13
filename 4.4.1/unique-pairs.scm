;;; Solutions copyright (C) 2007, Peter Danenberg; http://wizardbook.org
;;; Source code copyright (C) 1996, MIT; http://mitpress.mit.edu/sicp

(define unique-pairs
  '((assert! (rule (unique-pairs ?pairs ?unique-pairs)
                   (and (unique-values ?pairs ?reversed-pairs)
                        (unreversed-pairs ?reversed-pairs ?unique-pairs))))))
