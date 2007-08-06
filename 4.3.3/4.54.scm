(load "test.scm")
(load "install-packages.scm")
(load "ambeval-global.scm")
(load "distinct?.scm")
(load "multiple-dwelling-hierarchical.scm")

(install-packages)
(ambeval-global distinct?)
(ambeval-global multiple-dwelling-hierarchical)

(define multiple-dwelling
  (ambeval-global '(multiple-dwelling-hierarchical)))

(test
 "multiple-dwelling using new built-in require"
 '((baker 3) (cooper 2) (fletcher 4) (miller 5) (smith 1))
 multiple-dwelling
 'equal? equal?
 "SICP 4.3.2")
