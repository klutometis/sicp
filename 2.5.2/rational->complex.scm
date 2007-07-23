(load "get.scm")
(load "apply-generic.scm")

(define (rational->complex r)
  (apply-generic 'rational->complex r))
