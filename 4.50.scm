#!/usr/bin/env chicken-scheme

(use (only aima shuffle) debug sicp sicp-eval sicp-eval-amb test)

(define (ramb? exp) (tagged-list? exp 'ramb))

;; Thanks, Michael Richter, for taking a stab at a functional
;; quick-sort-like shuffle: <http://stackoverflow.com/q/3944556>.
(define (shuffle list)
  (cond ((null? list) '())
        ((null? (cdr list)) list)
        (else
         (call-with-values
          (lambda ()
            (partition
             (lambda (i) (< (random-real) 0.5))
             list))
        (lambda (left right)
          (append (shuffle right) (shuffle left)))))))

(define (analyze-ramb exp)
  (let ((cprocs (map analyze (amb-choices exp))))
    (lambda (env succeed fail)
      (define (try-next choices)
        (if (null? choices)
            (fail)
            ((car choices)
             env
             succeed
             (lambda () (try-next (cdr choices))))))
      ;; Let's shuffle the amb-choices here.
      (try-next (shuffle cprocs)))))

(define (analyze exp)
  (cond ((self-evaluating? exp) (analyze-self-evaluating exp))
        ((quoted? exp) (analyze-quoted exp))
        ((variable? exp) (analyze-variable exp))
        ((assignment? exp) (analyze-assignment exp))
        ((definition? exp) (analyze-definition exp))
        ((let-clause? exp) (analyze-let exp))
        ((if? exp) (analyze-if exp))
        ((lambda? exp) (analyze-lambda exp))
        ((begin? exp) (analyze-sequence (begin-actions exp)))
        ((cond? exp) (analyze (cond->if exp)))
        ((amb? exp) (analyze-amb exp))
        ;; Let's install ramb here.
        ((ramb? exp) (analyze-ramb exp))
        ((application? exp) (analyze-application exp))
        (else (error "Unknown expression type: ANALYZE" exp))))

(with-natural-language `((shuffle ,shuffle))
  (lambda (env)
    (ambeval* '(define (a-random-element-of items)
                 (require (not (null? items)))
                 (ramb (car items) (a-random-element-of (cdr items)))) env)
    (ambeval* `(define (parse-word word-list)
                 (list (car word-list) (a-random-element-of (cdr word-list))))
              env)
    (randomize 25)
    (test
     "Randomized sentence-generation"
     '((sentence (simple-noun-phrase (article a) (noun cat)) (verb eats)))
     (ambeval* '(parse '()) env 1))))
