(load "eval-global.scm")
(load "install-packages.scm")

(install-packages)

(eval-global '(define count 0))
(eval-global '(define (id x)
                (set! count (+ count 1))
                x))

(eval-global '(define w (id (id 10))))
(eval-global 'count)
;; 1
(eval-global 'w)
;; (thunk (id 10) (#[hash-table 70]))
(eval-global 'count)
;; 1
