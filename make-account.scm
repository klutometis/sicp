#!/usr/bin/env chicken-scheme

;; [[file:~/prg/sicp-klutometis/sicp.org::*3.3][3\.3:1]]

(define (make-account balance account-password)
  (lambda (password message)
    (lambda (amount)
      (if (eq? account-password password)
          (case message
            ((withdraw)
             (if (>= balance amount)
                 (begin (set! balance (- balance amount))
                        balance)
                 "Insufficient funds"))
            ((deposit)
             (set! balance (+ balance amount))
             balance)
            (else (error "Unknown request: MAKE-ACCOUNT" message)))
          "Incorrect password"))))

;; 3\.3:1 ends here
