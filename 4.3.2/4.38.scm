;;; Solutions copyright (C) 2007, Peter Danenberg; http://wizardbook.org
;;; Source code copyright (C) 1996, MIT; http://mitpress.mit.edu/sicp

(load "test.scm")
(load "install-packages.scm")
(load "ambeval-global.scm")
(load "ambeval-global-until-fail.scm")
(load "require.scm")
(load "distinct?.scm")
(load "multiple-dwelling-smith-fletcher-non-adjacent.scm")

(install-packages)
(ambeval-global require)
(ambeval-global distinct?)
(ambeval-global multiple-dwelling-smith-fletcher-non-adjacent)

(define smith-fletcher-non-adjacent
  (ambeval-global-until-fail '(multiple-dwelling-smith-fletcher-non-adjacent)))

;; Five solutions
(test
 "smith, fletcher non-adjacent"
 '(((baker 1) (cooper 2) (fletcher 4) (miller 3) (smith 5))
   ((baker 1) (cooper 2) (fletcher 4) (miller 5) (smith 3))
   ((baker 1) (cooper 4) (fletcher 2) (miller 5) (smith 3))
   ((baker 3) (cooper 2) (fletcher 4) (miller 5) (smith 1))
   ((baker 3) (cooper 4) (fletcher 2) (miller 5) (smith 1)))
 smith-fletcher-non-adjacent
 'equal? equal?)
