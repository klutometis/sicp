;;; Solutions copyright (C) 2007, Peter Danenberg; http://wizardbook.org
;;; Source code copyright (C) 1996, MIT; http://mitpress.mit.edu/sicp

(define unreversed-pairs
  '((assert! (rule (unreversed-pairs ?pairs ?unreversed-pairs)
                   (unreversed-pairs ?pairs () ?unreversed-pairs)))
    (assert! (rule (unreversed-pairs () ?unreversed-pairs ?unreversed-pairs)))
    (assert! (rule (unreversed-pairs (?head . ?tail) ?accumulated ?unreversed-pairs)
                   (or (and (and (reverse ?head ?reverse-head)
                                 (member ?reverse-head ?accumulated))
                            (unreversed-pairs ?tail ?accumulated ?unreversed-pairs))
                       (and (and (reverse ?head ?reverse-head)
                                 (not (member ?reverse-head ?accumulated)))
                            (unreversed-pairs ?tail (?head . ?accumulated) ?unreversed-pairs)))))))
