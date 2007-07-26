(load "exchange.scm")

(define (indexed-serialized-exchange account1 account2)
  (let ((serializer1 (account1 'serializer))
        (serializer2 (account2 'serializer)))
    (let ((exchange (if (< (account1 'index)
                           (account2 'index))
                        (serializer2 (serializer1 exchange))
                        ;; May include foreign, equal indices
                        (serializer1 (serializer2 exchange)))))
      (exchange account1 account2))))
