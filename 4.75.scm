#!/usr/bin/env chicken-scheme
(use sicp sicp-streams sicp-eval-logic test)

(define (uniquely-asserted operands frame-stream)
  (stream-flatmap
   (lambda (frame)
     (let ((stream (qeval (car operands) (singleton-stream frame))))
       (if (and (not (stream-null? stream))
                (stream-null? (stream-cdr stream)))
           stream
           the-empty-stream)))
   frame-stream))

(with-microshaft-database
 (lambda ()
   (put 'unique 'qeval uniquely-asserted)

   (test
    "Unique"
    '((and (supervisor (Cratchet Robert) (Scrooge Eben))
           (unique (supervisor (Cratchet Robert) (Scrooge Eben))))
      (and (supervisor (Reasoner Louis) (Hacker Alyssa P))
           (unique (supervisor (Reasoner Louis) (Hacker Alyssa P)))))
    (qeval* '(and (supervisor ?supervisee ?supervisor)
                  (unique (supervisor ?subsupervisee ?supervisor)))))))
