(load "make-account-indexer.scm")
(load "indexed-serialized-exchange.scm")

;; While the mutex is theoretically adequate for protecting one shared
;; resource from deadlocked acquisition; it cannot prevent multiple
;; resources from mutually exclusive acquisition.

;; The acquire-a-smaller-index-first method forces a virtually single
;; resource.

(define indexer (make-account-indexer))
(define account0 ((indexer 'make-account) 10))
(define account1 ((indexer 'make-account) 100))

(indexed-serialized-exchange account0 account1)
(account0 'balance)

(indexed-serialized-exchange account1 account0)
(account1 'balance)
