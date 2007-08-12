(define unique-pairs
  '((assert! (rule (unique-pairs ?pairs ?unique-pairs)
                   (and (unique-values ?pairs ?reversed-pairs)
                        (unreversed-pairs ?reversed-pairs ?unique-pairs))))))
