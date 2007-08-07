(load "context.scm")

(initialize-data-base '())

(query '(assert! (rule (last-pair (?x . ()) (?x)))))
(query '(assert! (rule (last-pair (?x . ?y) ?z) (last-pair ?y ?z))))

(define one-pair (query '(last-pair (3) ?x)))
(define three-pair (query '(last-pair (1 2 3) ?x)))
(define reverse-pair (query '(last-pair (2 ?x) (3))))

(test
 "one-pair last-pair"
 '((last-pair (3) (3)))
 one-pair
 'equal? equal?)

(test
 "three-pair last-pair"
 '((last-pair (3) (3)))
 one-pair
 'equal? equal?)

(test
 "reverse last-pair"
 '((last-pair (2 3) (3)))
 reverse-pair
 'equal? equal?)

(try-kill (lambda () (query '(last-pair ?x (3))))
          "infinite solutions to (last-pair ?x (3))"
          1000)
