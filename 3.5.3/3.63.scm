;;; Solutions copyright (C) 2007, Peter Danenberg; http://wizardbook.org
;;; Source code copyright (C) 1996, MIT; http://mitpress.mit.edu/sicp

;; The local-variable-form calculates each result within a
;; subenvironment; the straightforward form creates a new environment
;; for every invocation of sqrt-stream, regardless of whether delay
;; caches or not.
