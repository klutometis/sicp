(require-extension
 syntax-case
 check)
(require '../test/test)
(import test)
(check (terminate? (lambda () #t)) => #t)
(check (terminate? (lambda () ((lambda (x) (x x)) (lambda (x) (x x)))))
       => #f)
(check (approx? 1.6181 1.61814) => #t)
(check (approx? 1.6181 1.61815) => #f)
