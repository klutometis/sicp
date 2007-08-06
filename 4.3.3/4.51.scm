(load "test.scm")
(load "install-packages.scm")
(load "ambeval-global.scm")
(load "ambeval-global-n.scm")
(load "require.scm")
(load "an-element-of.scm")

(install-packages)
(ambeval-global require)
(ambeval-global an-element-of)

(ambeval-global '(define count 0))
(define permanent-assignment
  (ambeval-global-n
   '(let ((x (an-element-of '(a b c)))
          (y (an-element-of '(a b c))))
      (permanent-set! count (+ count 1))
      (require (not (eq? x y)))
      (list x y count)) 2))

(test
 "permanent assignment"
 '((a b 2) (a c 3))
 permanent-assignment
 'equal? equal?)
