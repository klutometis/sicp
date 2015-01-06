#!/usr/bin/env chicken-scheme

;; [[file:~/prg/sicp-klutometis/sicp.org::*3.48][3\.48:1]]

(use data-structures sicp-concurrency srfi-95 test)

(define current-account-number (make-parameter 0))

(define (exchange account1 account2)
  (let ((difference (- (account1 'balance)
                       (account2 'balance))))
    ((account1 'withdraw) difference)
    ((account2 'deposit) difference)))

(define (make-account-and-serializer balance)
  (define account-number
    (current-account-number (+ (current-account-number) 1)))
  (define (withdraw amount)
    (if (>= balance amount)
        (begin (set! balance (- balance amount))
               balance)
        "Insufficient funds"))
  (define (deposit amount)
    (set! balance (+ balance amount))
    balance)
  (let ((balance-serializer (make-serializer)))
    (define (dispatch m)
      (cond ((eq? m 'withdraw) withdraw)
            ((eq? m 'deposit) deposit)
            ((eq? m 'balance) balance)
            ((eq? m 'serializer) balance-serializer)
            ((eq? m 'account-number) account-number)
            (else (error "Unknown request: MAKE-ACCOUNT" m))))
    dispatch))

(define (deposit account amount)
  (let ((s (account 'serializer))
        (d (account 'deposit)))
    ((s d) amount)))

(define (account-number account)
  (account 'account-number))

(define (serializer account)
  (account 'serializer))

(define (sort-accounts accounts)
  (sort accounts < account-number))

(define (sort-serializers . accounts)
  (map serializer (sort-accounts accounts)))

;; This works by sorting the serializers by account-number of the
;; adherent accounts, composing and finally applying them to the
;; accounts.
(define (serialized-exchange account1 account2)
  (let ((serializers (sort-serializers account1 account2)))
    (((apply compose serializers) exchange)
     account1
     account2)))

(let ((peter (make-account-and-serializer 100))
      (paul (make-account-and-serializer 10)))
  (exchange peter paul)
  (test 10 (peter 'balance)))

;; 3\.48:1 ends here
