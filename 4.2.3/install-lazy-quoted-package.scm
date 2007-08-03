(load "put.scm")
(load "lazy-text-of-quotation.scm")

(define (install-lazy-quoted-package)
  (put 'quote (lambda (exp env) (lazy-text-of-quotation exp env)))
  'done)
