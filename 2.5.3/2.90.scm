(load "install-packages.scm")
(load "make-dense-polynomial.scm")
(load "make-sparse-polynomial.scm")
(load "add.scm")
(load "make-term.scm")
(load "apply-generic-raise.scm")

(install-packages)

(define dense (make-dense-polynomial 'x '(1 1 1)))
(define sparse (make-sparse-polynomial 'x (list (make-term 2 1)
                                                (make-term 1 1))))

;; NB: mixed dense/sparse operations default to sparse
(add dense sparse)
