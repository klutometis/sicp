;;; Solutions copyright (C) 2007, Peter Danenberg; http://wizardbook.org
;;; Source code copyright (C) 1996, MIT; http://mitpress.mit.edu/sicp

(load "test.scm")
(load "eval-global.scm")
(load "install-packages.scm")
(load "list-operations.scm")
(load "integral.scm")

(install-packages)

(define RLC
  (list
   '(define (RLC R L C dt)
      (lambda (vc0 il0)
        (define dil (add-lists (scale-list vc (/ 1 C))
                                 (scale-list il (- (/ R l)))))
        (define il (integral dil il0 dt))
        (define vc (integral dvc vc0 dt))
        (define dvc (scale-list il (- (/ 1 C))))
        (cons il vc)))
   '(define circuit ((rlc 1 0.1 1 0.1) 10 0))
   '(define il (list-ref (car circuit) 4))
   '(define vc (list-ref (cdr circuit) 4))
   ;; Force the values
   '(* il 1)
   '(* vc 1)))

(map eval-global list-operations)
(map eval-global integral)
(define RLC-test (map eval-global RLC))

;; The extra laziness denecessitates manual force-apply cycles; but an
;; (unidentified) source of exponential complexity renders
;; list-operations almost unusable.

(test
 "RLC-test"
 '(ok ok ok ok .98 9.701)
 RLC-test
 'equal? equal?)
