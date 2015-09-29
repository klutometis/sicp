#!/usr/bin/env chicken-scheme

(use sicp sicp-streams sicp-eval-logic test)

(with-empty-database
 (lambda ()
   (qeval* '(assert! (a 1)))
   (qeval* '(assert! (b 2)))
   (test
    "The original add-assertion! works."
    '((b 2) (a 1))
    (stream->list (the-assertions)))))

(define (add-assertion! assertion)
  (store-assertion-in-index assertion)
  (the-assertions (cons-stream assertion (the-assertions))))

(with-empty-database
 (lambda ()
   (qeval* '(assert! (a 1)))
   (qeval* '(assert! (b 2)))
   (test-assert
    "The new add-assertion! never returns."
    (not (terminates? (lambda () (stream->list (the-assertions))))))))
