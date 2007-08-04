(load "test.scm")
(load "install-packages.scm")
(load "ambeval-global.scm")
(load "ambeval-global-until-fail.scm")
(load "an-integer-between.scm")
(load "a-pythagorean-triple-between.scm")
(load "require.scm")

(install-packages)
(ambeval-global require)
(ambeval-global an-integer-between)
(ambeval-global a-pythagorean-triple-between)

(define pythagorean-triples (ambeval-global-until-fail '(a-pythagorean-triple-between 1 20)))

(test
 "pythagorean triples culled ambiguously"
 '((3 4 5) (5 12 13) (6 8 10) (8 15 17) (9 12 15))
 pythagorean-triples
 'equal? equal?
 "http://www.math.uic.edu/~fields/puzzle/triples.html")
