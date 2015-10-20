#!/usr/bin/env chicken-scheme
(use miscmacros test)

(define allowed-incorrect-accesses (make-parameter 7))

(define (make-account balance account-password)
  (let ((incorrect-accesses (allowed-incorrect-accesses)))
    (lambda (password message)
      (lambda (amount)
        (if (eq? account-password password)
            (begin
              (set! incorrect-accesses (allowed-incorrect-accesses))
              (case message
                ((withdraw)
                 (if (>= balance amount)
                     (begin (set! balance (- balance amount))
                            balance)
                     "Insufficient funds"))
                ((deposit)
                 (set! balance (+ balance amount))
                 balance)
                (else (error "Unknown request: MAKE-ACCOUNT" message))))
            (begin
              (set! incorrect-accesses (- incorrect-accesses 1))
              (if (negative? incorrect-accesses)
                  "Call the cops"
                  "Incorrect password")))))))

(let ((acc (make-account 100 'password)))
  (dotimes (i 7)
    (test "Incorrect password" ((acc 'not-password 'withdraw) 40)))
  (test "Call the cops" ((acc 'not-password 'withdraw) 40)))
