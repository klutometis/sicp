;;; Solutions copyright (C) 2007, Peter Danenberg; http://wizardbook.org
;;; Source code copyright (C) 1996, MIT; http://mitpress.mit.edu/sicp

(require-extension syntax-case check)
(require '../2.2.2/section)
(import* section-2.2.2
         make-mobile
         make-branch
         print-mobile
         total-weight
         mobile-balanced?)

(let ((mobile
       (make-mobile
        (make-branch
         1
         (make-mobile
          (make-branch 1 2) (make-branch 2 3)))
        (make-branch 2 3)))
      (balanced-mobile
       (make-mobile
        (make-branch 1 4)
        (make-branch
         1
         (make-mobile
          (make-branch 2 2)
          (make-branch 2 2))))))
 (check (with-output-to-string (lambda () (print-mobile mobile)))
        => "[1: [1: 2, 2: 3], 2: 3]")
 (check (total-weight mobile) => 8)
 (check (mobile-balanced? balanced-mobile) => #t))

;; branch-structure, branch-length, branch-left, branch-right would
;; have to be updated to use cdr, car.
