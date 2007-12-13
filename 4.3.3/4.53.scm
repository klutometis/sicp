;;; Solutions copyright (C) 2007, Peter Danenberg; http://wizardbook.org
;;; Source code copyright (C) 1996, MIT; http://mitpress.mit.edu/sicp

(load "test.scm")
(load "install-packages.scm")
(load "ambeval-global.scm")
(load "require.scm")
(load "prime-sum-pair.scm")
(load "an-element-of.scm")

(install-packages)
(ambeval-global require)
(ambeval-global an-element-of)
(map ambeval-global prime-sum-pair)

(define prime-sums
  (ambeval-global
   '(let ((pairs '()))
      (if-fail (let ((p (prime-sum-pair '(1 3 5 8) '(20 35 110))))
                 (permanent-set! pairs (cons p pairs))
                 (amb))
               pairs))))

(test
 "prime sums via if-fail"
 '((8 35) (3 110) (3 20))
 prime-sums
 'equal? equal?)
