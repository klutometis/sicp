(define unique-values
  '((assert! (rule (unique-values ?elements ?unique-elements)
                   (unique-values ?elements () ?unique-elements)))
    (assert! (rule (unique-values () ?unique-elements ?unique-elements)))
    (assert! (rule (unique-values (?head . ?tail) ?accumulated ?unique-elements)
                   (or (and (member ?head ?accumulated)
                            (unique-values ?tail ?accumulated ?unique-elements))
                       (and (not (member ?head ?accumulated))
                            (unique-values ?tail (?head . ?accumulated) ?unique-elements)))))))
