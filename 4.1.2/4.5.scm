(load "eval-global.scm")
(load "install-packages.scm")

(install-packages)

;; (trace make-lambda)
;; (eval-global '(define x 3))
;; (eval-global '(set! x 4))
;; (eval-global '(+ x x))
;(trace cond->if)
;(trace expand-clauses)
(eval-global '(cond (1 => (lambda (x) (+ x 1)))))
