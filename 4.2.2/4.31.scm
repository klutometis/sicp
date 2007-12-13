;;; Solutions copyright (C) 2007, Peter Danenberg; http://wizardbook.org
;;; Source code copyright (C) 1996, MIT; http://mitpress.mit.edu/sicp

(load "test.scm")
(load "eval-global.scm")
(load "install-packages.scm")
(load "apply-notated.scm")

(install-packages)

;; See apply-notated.scm, etc.

(eval-global '(define lazy-test 0))
(eval-global '((lambda (a (b lazy)) (if (= a 0) 1 b)) 0 (set! lazy-test 1)))
(define lazy-test (eval-global 'lazy-test))

(eval-global '(define strict-test 0))
(eval-global '((lambda (a b) (if (= a 0) 1 b)) 0 (set! strict-test 1)))
(define strict-test (eval-global 'strict-test))

(eval-global '(define (fib-lazy (n lazy))
                (cond ((= n 0) 0)
                      ((= n 1) 1)
                      (else (+ (fib-lazy (- n 1))
                               (fib-lazy (- n 2)))))))

(eval-global '(define (fib-lazy-memo (n lazy-memo))
                (cond ((= n 0) 0)
                      ((= n 1) 1)
                      (else (+ (fib-lazy-memo (- n 1))
                               (fib-lazy-memo (- n 2)))))))

(define fib-lazy
  (let ((result 0))
    (with-timings
     (lambda () (eval-global '(fib-lazy 10)))
     (lambda (run-time gc-time real-time)
       (set! result real-time)))
    result))

(define fib-lazy-memo
  (let ((result 0))
    (with-timings
     (lambda () (eval-global '(fib-lazy-memo 10)))
     (lambda (run-time gc-time real-time)
       (set! result real-time)))
    result))

(test
 "ad-hoc lazy evaluation"
 0
 lazy-test
 '=
 =)

(test
 "strict evaluation"
 1
 strict-test
 '=
 =)

(test
 "lazy vs. memoized-lazy fib"
 "[1, inf)"
 (/ fib-lazy fib-lazy-memo)
 '(> (/ (time fib-lazy)
        (time fib-lazy-memo)) 1)
 (lambda (n/a ratio) (> ratio 1.0)))
