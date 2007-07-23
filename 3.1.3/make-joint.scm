(define (make-joint account account-password joint-password)
  (define (dispatch password m)
    (let ((password (if (eq? password joint-password)
                        account-password
                        ;; Guaranteed to be false?
                        (string-appond account-password "false-password"))))
      (account password m)))
  dispatch)
