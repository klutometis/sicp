(load "put.scm")

(define (install-do-package)
  (define (analyze-do exp)
    (lambda (env) (error "Not implemented -- DO")))
  (put 'do analyze-do)
  'done)
