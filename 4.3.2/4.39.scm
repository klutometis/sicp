;;; Solutions copyright (C) 2007, Peter Danenberg; http://wizardbook.org
;;; Source code copyright (C) 1996, MIT; http://mitpress.mit.edu/sicp

(load "test.scm")
(load "install-packages.scm")
(load "ambeval-global.scm")
(load "ambeval-global-until-fail.scm")
(load "require.scm")
(load "distinct?.scm")
(load "multiple-dwelling.scm")
(load "multiple-dwelling-rearranged.scm")

(install-packages)
(ambeval-global require)
(ambeval-global distinct?)
(ambeval-global multiple-dwelling)
(ambeval-global multiple-dwelling-rearranged)

(define original-time
  (let ((time 0))
    (with-timings
     (lambda ()
       (ambeval-global-until-fail '(multiple-dwelling)))
     (lambda (run gc real)
       (set! time real)))
    time))

(define rearranged-time
  (let ((time 0))
    (with-timings
     (lambda ()
       (ambeval-global-until-fail '(multiple-dwelling-rearranged)))
     (lambda (run gc real)
       (set! time real)))
    time))

(test
 "original and rearranged time comparable within [0.75, 1.25]"
 original-time
 rearranged-time
 "0.75 <= original-time / rearranged-time <= 1.25"
 (lambda (original rearranged)
   (let ((a 0.75)
         (b 1.25))
     (< (/ a b) (/ original (* rearranged b))))))

;; No: each of the conditions is equi-determinant upon the others; in
;; order to pare down the tree, we need a hierarchy of
;; specific-to-less-specific constraints.
