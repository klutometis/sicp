(load "install-packages.scm")
(load "add.scm")
(load "make-sparse-polynomial.scm")
(load "make-term.scm")
(load "apply-generic-raise.scm")

(install-packages)

(define augend
  (make-sparse-polynomial 'x
                          (list (make-term 1 1)
                                (make-term 0 (make-sparse-polynomial 'y (list (make-term 1 1)))))))

(define addend
  (make-sparse-polynomial 'x
                          (list (make-term 1 1)
                                (make-term 0 1))))

;; TODO
(add augend addend)
