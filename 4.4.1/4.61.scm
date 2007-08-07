(load "context.scm")
(initialize-data-base '())

(query '(rule (?x next-to ?y in (?x ?y . ?u))))
(query '(rule (?x next-to ?y in (?v . ?z))
              (?x next-to ?y in ?z)))
(define a (query '(?x next-to ?y in (1 (2 3) 4))))
(define b (query '(?x next-to ?y in (2 1 3 1))))

(test
 "appears to be empty, both"
 a
 b
 'eq? eq?)
