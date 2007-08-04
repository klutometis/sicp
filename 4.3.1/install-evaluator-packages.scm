(load "require.scm")
(load "an-element-of.scm")
(load "an-integer-starting-from.scm")
(load "ambeval-global.scm")

(define (install-evaluator-packages)
  (map ambeval-global
       (list
        require
        an-element-of
        an-integer-starting-from)))
