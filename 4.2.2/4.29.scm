(load-option 'regular-expression)
(load-option 'format)

(load "test.scm")
(load "eval-global.scm")
(load "install-packages.scm")

(install-packages)

(eval-global
 '(define (fib n)
    (cond ((= n 0) 0)
          ((= n 1) 1)
          (else (+ (fib (- n 1))
                   (fib (- n 2)))))))

(define non-memoized-fib 0)

(define (time-fib n)
  (let ((result 0))
    (with-timings
     (lambda () (eval-global `(fib ,n)))
     (lambda (run-time gc-time real-time)
       (set! result real-time)))
    result))

(define expressions
  (list '(define count 0)
        '(define (id x)
           (set! count (+ count 1))
           x)
        '(define (square x)
           (* x x))
        '(square (id 10))
        'count))

(load "force-it.scm")
(define interaction-memoized (map eval-global expressions))
(define memoized-fib (time-fib 15))

(load "force-it-non-memoized.scm")
(define interaction-non-memoized (map eval-global expressions))
(define non-memoized-fib (time-fib 15))

interaction-memoized
interaction-non-memoized
memoized-fib
non-memoized-fib

(test
 "memoized interaction"
 "(ok ok ok 100 1)"
 interaction-memoized
 're-string-matched
 (lambda (expected got)
   (not (false? (re-string-match expected (format #f "~A" got))))))

(test
 "non-memoized interaction"
 "(ok ok ok 100 2)"
 interaction-non-memoized
 're-string-matched
 (lambda (expected got)
   (not (false? (re-string-match expected (format #f "~A" got))))))

(test
 "memoized fib vs. non-memoized fib"
 "[1, inf)"
 (/ non-memoized-fib memoized-fib)
 '(> (time non-memoized-fib)
     (time memoized-fib) 1)
 (lambda (n/a ratio) (> ratio 1.0)))
