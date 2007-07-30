(load "eval-global.scm")
(load "install-packages.scm")

(install-packages)

(eval-global '(define (fib n)
                (let fib-iter ((a 1)
                               (b 0)
                               (count n))
                  (if (= count 0)
                      b
                      (fib-iter (+ a b) a (- count 1))))))

(define fib-6 (eval-global '(fib 6)))

(test
 "named-let sixth fibonacci"
 8
 fib-6
 '=
 =
 "http://www.research.att.com/~njas/sequences/A000045")
