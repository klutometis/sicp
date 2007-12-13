;;; Solutions copyright (C) 2007, Peter Danenberg; http://wizardbook.org
;;; Source code copyright (C) 1996, MIT; http://mitpress.mit.edu/sicp

(load "context.scm")

(initialize-data-base microshaft-data-base)

(define ben-superviseth
  (query '(and (supervisor ?supervisee (Bitdiddle Ben))
               (address ?supervisee ?where))))
(define poorer-than-ben
  (query '(and (salary (Bitdiddle Ben) ?ben-salary)
               (salary ?person ?salary)
               (lisp-value < ?salary ?ben-salary))))
(define non-comptor-superviseth
  (query '(and (supervisor ?supervisee ?supervisor)
               (not (job ?supervisor (computer . ?something)))
               (job ?supervisor ?supervisement))))

(test
 "whom ben superviseth"
 '((and (supervisor (tweakit lem e) (bitdiddle ben)) (address (tweakit lem e) (boston (bay state road) 22))) (and (supervisor (fect cy d) (bitdiddle ben)) (address (fect cy d) (cambridge (ames street) 3))) (and (supervisor (hacker alyssa p) (bitdiddle ben)) (address (hacker alyssa p) (cambridge (mass ave) 78))))
 ben-superviseth
 'equal? equal?)

(test
 "poorer than ben"
 '((and (salary (bitdiddle ben) 60000) (salary (aull dewitt) 25000) (lisp-value < 25000 60000)) (and (salary (bitdiddle ben) 60000) (salary (cratchet robert) 18000) (lisp-value < 18000 60000)) (and (salary (bitdiddle ben) 60000) (salary (reasoner louis) 30000) (lisp-value < 30000 60000)) (and (salary (bitdiddle ben) 60000) (salary (tweakit lem e) 25000) (lisp-value < 25000 60000)) (and (salary (bitdiddle ben) 60000) (salary (fect cy d) 35000) (lisp-value < 35000 60000)) (and (salary (bitdiddle ben) 60000) (salary (hacker alyssa p) 40000) (lisp-value < 40000 60000)))
 poorer-than-ben
 'equal? equal?)

(test
 "non-comptor superviseth"
 '((and (supervisor (aull dewitt) (warbucks oliver)) (not (job (warbucks oliver) (computer . ?something))) (job (warbucks oliver) (administration big wheel))) (and (supervisor (cratchet robert) (scrooge eben)) (not (job (scrooge eben) (computer . ?something))) (job (scrooge eben) (accounting chief accountant))) (and (supervisor (scrooge eben) (warbucks oliver)) (not (job (warbucks oliver) (computer . ?something))) (job (warbucks oliver) (administration big wheel))) (and (supervisor (bitdiddle ben) (warbucks oliver)) (not (job (warbucks oliver) (computer . ?something))) (job (warbucks oliver) (administration big wheel))))
 non-comptor-superviseth
 'equal? equal?)
