(load "context.scm")
(load "genealogy.scm")

(initialize-data-base '())
(install genealogy)

(define great-grandsons (query '((great great grandson) ?x ?y)))
(define fives-great-grandsons (query '((great great great great great grandson) ?x ?y)))
(define adam-irad (query '(?relationship adam irad)))

(test
 "great grandsons"
 '(((great great grandson) irad jubal) ((great great grandson) enoch lamech) ((great great grandson) irad jabal) ((great great grandson) cain methushael) ((great great grandson) adam mehujael))
 great-grandsons
 'equal? equal?)

(test
 "five-times great grandsons"
 '(((great great great great great grandson) adam jubal) ((great great great great great grandson) adam jabal))
 fives-great-grandsons
 'equal? equal?)

(test
 "relationship between adam and irad (some redundancy)"
 '(((great great . son) adam irad) ((great grandson) adam irad))
 adam-irad
 'equal? equal?)
