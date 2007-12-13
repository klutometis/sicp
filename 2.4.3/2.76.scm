;;; Solutions copyright (C) 2007, Peter Danenberg; http://wizardbook.org
;;; Source code copyright (C) 1996, MIT; http://mitpress.mit.edu/sicp

;; Whereas dispatching on type seems universally awkward,
;; data-directed dispatch works well for adding types and functions.
;; Message-passing seems to be a compromise when dealing with new
;; types, but is uncomfortably close to explicit dispatch (case
;; statements vs. lookup).
