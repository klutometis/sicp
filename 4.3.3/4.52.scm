;;; Solutions copyright (C) 2007, Peter Danenberg; http://wizardbook.org
;;; Source code copyright (C) 1996, MIT; http://mitpress.mit.edu/sicp

(load "test.scm")
(load "install-packages.scm")
(load "ambeval-global.scm")
(load "require.scm")
(load "an-element-of.scm")

(install-packages)
(ambeval-global require)
(ambeval-global an-element-of)

(define all-odd
  (ambeval-global
   '(if-fail (let ((x (an-element-of '(1 3 5))))
               (require (even? x))
               x)
             'all-odd)))

(define one-even
  (ambeval-global
   '(if-fail (let ((x (an-element-of '(1 3 5 8))))
               (require (even? x))
               x)
             'all-odd)))

(test
 "returneth failure"
 'all-odd
 all-odd
 'eq? eq?
 "SICP 4.3.3")

(test
 "returneth success"
 '8
 8
 '= =
 "SICP 4.3.3")
