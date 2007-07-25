;; Unless there is some subtlety I'm missing here, both version allow
;; the same concurrency; that is, the stored serialized procedure
;; still acquires and releases the mutex on each successive call.

;; In the first version, however, a new environment is instantiated
;; under make-serializer for every new procedure; which doesn't seem
;; to make a difference.

