;;; Solutions copyright (C) 2007, Peter Danenberg; http://wizardbook.org
;;; Source code copyright (C) 1996, MIT; http://mitpress.mit.edu/sicp

(load "amb-context.scm")

(install-packages)

;; self-evaluating
(define self-evaluating (ambeval-global '2))

(test
 'self-evaluating
 2
 self-evaluating
 '=
 =)

;; definition
(ambeval-global '(define x 3))
(define definition (ambeval-global 'x))

(test
 'definition
 3
 definition
 '=
 =)

;; application
(define application (ambeval-global '(+ 2 x)))

(test
 'application
 5
 application
 '=
 =)

;; assignment
(ambeval-global '(set! x 4))
(define assignment (ambeval-global '(+ 2 4)))

(test
 'assignment
 6
 assignment
 '=
 =)

;; if
(define if-clause (ambeval-global '(if true 1)))

(test
 'if
 1
 if-clause
 '=
 =)

;; cond
(define cond-clause (ambeval-global '(cond (false 0) (else 1))))

(test
 'cond
 1
 cond-clause
 '=
 =)

;; lambda
(define lambda-clause (ambeval-global '((lambda () 1))))

(test
 'lambda
 1
 lambda-clause
 '=
 =)

;; begin
;; (define begin-clause (ambeval-global '(if 1 (begin (set! x 4) x))))

;; (test
;;  'begin
;;  4
;;  begin-clause
;;  '=
;;  =)

(ambeval-global '(define (f x)
                (define (even? n)
                  (if (= n 0)
                      true
                      (odd? (- n 1))))
                (define (odd? n)
                  (if (= n 0)
                      false
                      (even? (- n 1))))
                (cons (odd? x) (even? x))))

(define internal-def (ambeval-global '(f 1)))

(test
 "internal definitions"
 (cons #t #f)
 internal-def
 'equal?
 equal?)

;; (define do-clause (ambeval-global '(let ((x '(1 3 5 7 9)))
;;                                   (do ((x x (quote (cdr x)))
;;                                        (sum 0 (+ sum (car x))))
;;                                       ((null? x) sum)))))

;; (test
;;  "do-clause"
;;  25
;;  do-clause
;;  '=
;;  =
;;  "http://www.gnu.org/software/mit-scheme/documentation/mit-scheme-ref/Iteration.html#index-do-342")

;; (ambeval-global '(define (fib n)
;;                 (let fib-iter ((a 1)
;;                                (b 0)
;;                                (count n))
;;                   (if (= count 0)
;;                       b
;;                       (fib-iter (+ a b) a (- count 1))))))

;; (define fib-6 (ambeval-global '(fib 6)))

;; (test
;;  "named-let sixth fibonacci"
;;  8
;;  fib-6
;;  '=
;;  =
;;  "http://www.research.att.com/~njas/sequences/A000045")

(define let*-test (ambeval-global '(let* ((x 3) (y (+ x 2)) (z (+ x y 5))) (write-line x) (* x z))))

(test
 "let*-clause"
 39
 let*-test
 '=
 =)

(define let-test (ambeval-global '(let ((x 1) (y 2)) (write-line x) y)))

(test
 "let clause"
 2
 let-test
 '=
 =)

(ambeval-global '(define (assoc object alist)
                (if (null? alist)
                    false
                    (let* ((association (car alist))
                           (key (car association)))
                      (if (equal? object key)
                          association
                          (assoc object (cdr alist)))))))

(define extended-cond
  (ambeval-global '(cond ((assoc 'b '((a 1) (b 2))) => cadr)
                      (else false))))

(test
 "extended cond"
 2
 extended-cond
 '=
 =)

(define test-and (ambeval-global '(and true true (and false 1))))
(define test-or (ambeval-global '(or false false (or false true))))

(test
 "and with n args and sub-ands"
 #f
 test-and
 'eq?
 eq?)

(test
 "or with n args and sub-ors"
 #t
 test-or
 'eq?
 eq?)

;; (define unbind-test
;;   (ambeval-global '(let ((x 3))
;;                   (let ((x 2))
;;                     (unbind! x)
;;                     x))))

;; (test
;;  "unbind test"
;;  3
;;  unbind-test
;;  '=
;;  =)

(define fact-10
  (ambeval-global '((lambda (n)
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
  (ambeval-global '((lambda (n)
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

(ambeval-global '(define (f x)
                ((lambda (even? odd?)
                   (even? even? odd? x))
                 (lambda (ev? od? n)
                   (if (= n 0) true (od? ev? od? (- n 1))))
                 (lambda (ev? od? n)
                   (if (= n 0) false (ev? ev? od? (- n 1)))))))

(define even-odd (ambeval-global '(cons (f 4) (f 3))))

(test
 "y-combinator even"
 (cons #t #f)
 even-odd
 'equal?
 equal?)

;; (define fact-10
;;   (ambeval-global '(letrec ((fact
;;                           (lambda (n)
;;                             (if (= n 1)
;;                                 1
;;                                 (* n (fact (- n 1)))))))
;;                   (fact 10))))

;; (test
;;  "letrec-factorial"
;;  3628800
;;  fact-10
;;  '=
;;  =)
