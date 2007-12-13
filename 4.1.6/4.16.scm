;;; Solutions copyright (C) 2007, Peter Danenberg; http://wizardbook.org
;;; Source code copyright (C) 1996, MIT; http://mitpress.mit.edu/sicp

(load "test.scm")
(load "eval-global.scm")
(load "install-packages.scm")

(install-packages)

(eval-global '(define (f x)
                (define (even? n)
                  (if (= n 0)
                      true
                      (odd? (- n 1))))
                (define (odd? n)
                  (if (= n 0)
                      false
                      (even? (- n 1))))
                (cons (odd? x) (even? x))))

(define internal-def (eval-global '(f 1)))

(test
 "internal definitions"
 (cons #t #f)
 internal-def
 'equal?
 equal?)

;; We placed scan-out-defines in procedure-body, being fans of
;; just-in-time-evaluation; it allows maximum flexibility of
;; expression-transformation, should derived expressions preëmpt the
;; scan-out-definitions.

