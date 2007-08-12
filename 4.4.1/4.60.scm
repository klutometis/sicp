(load "context.scm")

(initialize-data-base microshaft-data-base)

;; (lives-near ?p1 ?p2) operates on the full set of addresses for ?p1
;; and ?p2, whereby each address shows up as subject and object.

;; Using alien state (an egregious hack), we can introduce a
;; (unique-pair? p) predicate.

(define unique-pairs '())
(query '(assert!
         (rule (unique-pair? ?p ?q)
               (lisp-value
                (lambda (p q)
                  (let ((pair (list p q)))
                    (if (or (member pair unique-pairs)
                            (member (reverse pair) unique-pairs))
                        #f
                        (begin (if (null? unique-pairs)
                                   (set! unique-pairs (list pair))
                                   (append! unique-pairs (list pair)))
                               #t)))) ?p ?q))))
(query '(assert!
         (rule (lives-near-unique ?p1 ?p2)
               (and (lives-near ?p1 ?p2)
                    (unique-pair? ?p1 ?p2)))))

(define lives-near-unique (query '(lives-near-unique ?p1 ?p2)))


(test
 "lives-near unique"
 '((lives-near-unique (aull dewitt) (reasoner louis)) (lives-near-unique (aull dewitt) (bitdiddle ben)) (lives-near-unique (reasoner louis) (bitdiddle ben)) (lives-near-unique (hacker alyssa p) (fect cy d)))
 lives-near-unique
 'equal? equal?)
