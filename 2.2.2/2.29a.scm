(load "mobile.scm")

(define mobile (make-mobile (make-branch 1 (make-mobile (make-branch 1 2) (make-branch 2 3))) (make-branch 2 3)))
(print-mobile mobile)
