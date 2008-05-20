(require-extension
 syntax-case
 check)
(require '../test/test)
(import test)
(check (terminate? (lambda () ((lambda (x) (x x)) (lambda (x) (x x)))))
       => #f)
