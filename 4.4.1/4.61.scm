(load "context.scm")

(initialize-data-base '())

(query '(assert! (rule (?x next-to ?y in (?x ?y . ?u)))))
(query '(assert! (rule (?x next-to ?y in (?v . ?z))
                       (?x next-to ?y in ?z))))
(define sub-list-proximity (query '(?x next-to ?y in (1 (2 3) 4))))
(define flat-proximity (query '(?x next-to ?y in (2 1 3 1))))

(test
 "proximity with sub-lists"
 '(((2 3) next-to 4 in (1 (2 3) 4)) (1 next-to (2 3) in (1 (2 3) 4)))
 sub-list-proximity
 'equal? equal?)

(test
 "flat-list proximity"
 '((3 next-to 1 in (2 1 3 1)) (2 next-to 1 in (2 1 3 1)) (1 next-to 3 in (2 1 3 1)))
 flat-proximity
 'equal? equal?)
