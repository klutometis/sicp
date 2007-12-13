;;; Solutions copyright (C) 2007, Peter Danenberg; http://wizardbook.org
;;; Source code copyright (C) 1996, MIT; http://mitpress.mit.edu/sicp

(load "list->tree.scm")

(define lst '(1 3 5 7 9 11))

(trace partial-tree)
(list->tree lst)

;; Divides list int two equal parts: left, right (the right part
;; getting one or two extra elements: odd, even; respectively).  It
;; uses the first element of the right half as the root.  It then
;; successively processes the remaining right and left parts in a
;; similar fashion until n = 0; at which point there is a leaf (and it
;; cons nil).

;; To process either given half of the tree, should be theta(log n)
;; (cf.  binary search).  Together, however, they are not worse than
;; theta(n), since each element must be processed.
