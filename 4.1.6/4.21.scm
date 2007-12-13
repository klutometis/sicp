;;; Solutions copyright (C) 2007, Peter Danenberg; http://wizardbook.org
;;; Source code copyright (C) 1996, MIT; http://mitpress.mit.edu/sicp

(load "test.scm")
(load "eval-global.scm")
(load "install-packages.scm")

(install-packages)

(define fact-10
  (eval-global '((lambda (n)
                   ((lambda (fact)
                      (fact fact n))
                    (lambda (ft k)
                      (if (= k 1)
                          1
                          (* k (ft ft (- k 1)))))))
                 10)))

(test
 "y-combinator factorial"
 3628800
 fact-10
 '=
 =)

(define fib-10
  (eval-global '((lambda (n)
                   ((lambda (fib)
                      (fib fib n))
                    (lambda (fb k)
                      (cond ((= k 0) 0)
                            ((= k 1) 1)
                            (else (+ (fb fb (- k 2))
                                     (fb fb (- k 1))))))))
                 10)))

(test
 "y-combinator fibonacci"
 55
 fib-10
 '=
 =)

(eval-global '(define (f x)
                ((lambda (even? odd?)
                   (even? even? odd? x))
                 (lambda (ev? od? n)
                   (if (= n 0) true (od? ev? od? (- n 1))))
                 (lambda (ev? od? n)
                   (if (= n 0) false (ev? ev? od? (- n 1)))))))

(define even-odd (eval-global '(cons (f 4) (f 3))))

(test
 "y-combinator even"
 (cons #t #f)
 even-odd
 'equal?
 equal?)
