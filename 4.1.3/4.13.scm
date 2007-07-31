(load "eval-global.scm")
(load "install-packages.scm")

(install-packages)

;; See:
;; eval-unbind.scm
;; install-unbind-package.scm
;; make-unbound!.scm
;; unbind-variable!.scm

;; We decided to unbind the variable in the most proximate frame for
;; flexibility; an (utterly-unbind!) procedure would then be possible
;; by recursively unbinding up to the top frame.
(eval-global '(let ((x 3))
                (let ((x 2))
                  (unbind! x)
                  x)))
