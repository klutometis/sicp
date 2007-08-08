(load-option 'format)

(define reverse
  '((assert! (rule (reverse () ())))
    (assert! (rule (reverse (?head . ?tail) ?list)
                   (and (reverse ?tail ?reverse-tail)
                        (append-to-form ?reverse-tail (?head) ?list))))))
