(load "test.scm")
(load "eval-global.scm")
(load "install-packages.scm")
(load "get.scm")
(load "put.scm")

(install-packages)

;; Sufficeth it merely to translate keywords?
(define mappings '((shoop-da-whoop define)
                   (imma-firing-mah-lazer set!)))    ; etc.

(for-each (lambda (mapping)
            (let ((whither (car mapping))
                  (whence (cadr mapping)))
              (put whither (get whence)))) mappings)


(eval-global '(shoop-da-whoop x 'cracky-chan))
(eval-global '(imma-firing-mah-lazer x 'raptor-jesus))
(define mapping-test (eval-global 'x))

(test
 "trivial mapping test"
 'raptor-jesus
 mapping-test
 'eq?
 eq?
 "http://img.4chan.org/b/")
