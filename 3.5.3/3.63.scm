;; The local-variable-form calculates each result within a
;; subenvironment; the straightforward form creates a new environment
;; for every invocation of sqrt-stream, regardless of whether delay
;; caches or not.
