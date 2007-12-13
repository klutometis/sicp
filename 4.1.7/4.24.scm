;;; Solutions copyright (C) 2007, Peter Danenberg; http://wizardbook.org
;;; Source code copyright (C) 1996, MIT; http://mitpress.mit.edu/sicp

(load "eval-global.scm")
(load "install-packages.scm")

(install-packages)

(with-timings
 (lambda () (eval-global '((lambda (n)
                             ((lambda (fib)
                                (fib fib n))
                              (lambda (fb k)
                                (cond ((= k 0) 0)
                                      ((= k 1) 1)
                                      (else (+ (fb fb (- k 2))
                                               (fb fb (- k 1))))))))
                           20)))
 (lambda (run-time gc-time real-time)
   (write-line run-time)
   (write-line gc-time)
   (write-line real-time)))

;; In a recent test, the above took 21358 ticks on a non-analyzing
;; evaluator (NAE); but 7908 ticks on the analyzing evaluator (AE).  If
;; we allow for phi^20/sqrt(5) ~= 6765.0 operations, NAE takes 3.1571
;; ticks per operation; while AE, 1.1690.

;; Over 37% of NAE's operation time is usurped by parsing.
