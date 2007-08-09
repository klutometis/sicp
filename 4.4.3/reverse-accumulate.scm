(load-option 'format)

;; Snarfed from James Power's Prolog Tutorial:
;; http://www.cs.nuim.ie/~jpower/Courses/PROLOG/list-acc.html
(define reverse-accumulate
  '((assert! (rule (reverse ?list ?reversed)
                   ;; Call the three-argument version with accumulator
                   (reverse ?list () ?reversed)))
    ;; When the first list is exhausted, you're left with the
    ;; accumulated list; which happens to be the reversed list.
    (assert! (rule (reverse () ?reversed ?reversed)))
    ;; Successively move ?heads to the ?accumulated, leaving ?reversed
    ;; alone until the second rule.
    (assert! (rule (reverse (?head . ?tail) ?accumulated ?reversed)
                   (reverse ?tail (?head . ?accumulated) ?reversed)))))
