(load "put.scm")
(load "lazy-text-of-quotation.scm")

(define (install-lazy-quoted-package)
  (put 'quote lazy-text-of-quotation)
  'done)
