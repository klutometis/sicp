(load "context.scm")

(initialize-data-base microshaft-data-base)

;; (lives-near ?p1 ?p2) and similar operate recursively on ?p1 and
;; ?p2, whereby each shows up as subject and object.

;; In order to introduce a (unique-pair? p) predicate, it appears we
;; have to introduce state; which is contrary to the spirit of logical
;; programming.

;; On the other hand, we have append; why not implement car and cdr?

(define unique-pairs '())
(query '(rule (unique-pair? ?p ?q)
              (lisp-value
               (lambda (p q)
                 (let ((pair (list p q)))
                   (if (or (member pair unique-pairs)
                           (member (reverse pair) unique-pairs))
                       #f
                       (begin (if (null? unique-pairs)
                                  (set! unique-pairs (list pair))
                                  (append! unique-pairs (list pair)))
                              #t)))) ?p ?q)))
(query '(rule (lives-near-unique ?p1 ?p2)
              (and (lives-near ?p1 ?p2)
                   (unique-pair? ?p1 ?p2))))

(define lives-near-unique (query '(lives-near-unique ?p1 ?p2)))


(test
 "lives-near unique"
 '((lives-near-unique (aull dewitt) (reasoner louis)) (lives-near-unique (aull dewitt) (bitdiddle ben)) (lives-near-unique (reasoner louis) (bitdiddle ben)) (lives-near-unique (hacker alyssa p) (fect cy d)))
 lives-near-unique
 'equal? equal?)
