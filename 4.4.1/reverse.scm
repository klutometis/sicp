;;; Solutions copyright (C) 2007, Peter Danenberg; http://wizardbook.org
;;; Source code copyright (C) 1996, MIT; http://mitpress.mit.edu/sicp

(load-option 'format)

(define reverse
  '((assert! (rule (reverse () ())))
    (assert! (rule (reverse (?head . ?tail) ?list)
                   (and (reverse ?tail ?reverse-tail)
                        (append-to-form ?reverse-tail (?head) ?list))))))
