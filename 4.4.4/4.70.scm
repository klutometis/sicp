;;; Solutions copyright (C) 2007, Peter Danenberg; http://wizardbook.org
;;; Source code copyright (C) 1996, MIT; http://mitpress.mit.edu/sicp

(load "query-context.scm")
(load "query/genealogy.scm")

(initialize-data-base '())

(install genealogy)

(define finishes (query '((great great great great great grandson) ?x ?y)))

(define (add-assertion! assertion)
  (store-assertion-in-index assertion)
  (set! THE-ASSERTIONS
        (cons-stream assertion THE-ASSERTIONS))
  'ok)

(install genealogy)

(test
 "query finishes before redefinition of add-assertion!"
 '(((great great great great great grandson) adam jubal) ((great great great great great grandson) adam jabal))
 finishes
 'equal? equal?)

(try-kill
 (lambda () (query '((great great great great great grandson) ?x ?y)))
 "infinite loop after redefinition of add-assertion!"
 1000)

;; (let ...) creates an environment in which to delay the processing
;; of THE-ASSERTIONS until cons-stream can successfully set up a
;; promise; it does so by way of ((lambda () <body>) THE-ASSERTIONS).
