#!/usr/bin/env chicken-scheme

(use sicp sicp-eval-logic srfi-69 test)

(with-microshaft-database
 (lambda ()
   (qeval* '(assert!
             (rule (lives-near ?person-1 ?person-2)
                   (and (address ?person-1
                                 (?town . ?rest-1))
                        (address ?person-2
                                 (?town . ?rest-2))
                        (not (same ?person-1 ?person-2))))))
   (test
    "Only one pair comes up, given a name."
    '((lives-near (Fect Cy D) (Hacker Alyssa P)))
    (qeval* '(lives-near ?x (Hacker Alyssa P))))

   (test
    "Each pair comes up, given no name"
    '((lives-near (Aull DeWitt) (Reasoner Louis))
      (lives-near (Aull DeWitt) (Bitdiddle Ben))
      (lives-near (Reasoner Louis) (Aull DeWitt))
      (lives-near (Reasoner Louis) (Bitdiddle Ben))
      (lives-near (Hacker Alyssa P) (Fect Cy D))
      (lives-near (Fect Cy D) (Hacker Alyssa P))
      (lives-near (Bitdiddle Ben) (Aull DeWitt))
      (lives-near (Bitdiddle Ben) (Reasoner Louis)))
    (qeval* '(lives-near ?person-1 ?person-2)))

   ;; HACK: This is an awkward mechanism for defining a variable in
   ;; the interaction-environment.
   (eval '(define lives-near (make-hash-table)) (interaction-environment))
   
   (qeval* '(assert!
             (rule (lives-near-once ?person-1 ?person-2)
                   (and (address ?person-1
                                 (?town . ?rest-1))
                        (address ?person-2
                                 (?town . ?rest-2))
                        (not (same ?person-1 ?person-2))
                        (lisp-value (lambda (person-1 person-2)
                                      (hash-table-set! lives-near (cons person-1 person-2) #t)
                                      (hash-table-ref/default lives-near (cons person-2 person-1) #f))
                                    ?person-1 ?person-2)))))

   (test
    "Show each person only once with recourse to a hash-table in the interaction-environment"
    '((lives-near-once (Reasoner Louis) (Aull DeWitt))
      (lives-near-once (Fect Cy D) (Hacker Alyssa P))
      (lives-near-once (Bitdiddle Ben) (Aull DeWitt))
      (lives-near-once (Bitdiddle Ben) (Reasoner Louis)))
    (qeval* '(lives-near-once ?person-1 ?person-2)))))
