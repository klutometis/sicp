(load "mobile.scm")

(define mobile (make-mobile (make-branch 1 4) (make-branch 1 (make-mobile (make-branch 2 2) (make-branch 2 2)))))
(print-mobile mobile)
(mobile-balanced? mobile)
