(load "put.scm")
(load "text-of-quotation.scm")

(define (install-quoted-package)
  (put 'quoted (lambda (exp env) (text-of-quotation exp)))
  'done)
