;;; Solutions copyright (C) 2007, Peter Danenberg; http://wizardbook.org
;;; Source code copyright (C) 1996, MIT; http://mitpress.mit.edu/sicp

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
                   ;; Add a length of list predicate to make possible
                   ;; reverse-reverse? See:
                   ;; http://groups.google.com/group/comp.lang.scheme/msg/a919524fc0464834
                   (reverse ?tail (?head . ?accumulated) ?reversed)))))
