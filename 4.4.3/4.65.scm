;;; Solutions copyright (C) 2007, Peter Danenberg; http://wizardbook.org
;;; Source code copyright (C) 1996, MIT; http://mitpress.mit.edu/sicp

(load "context.scm")

(initialize-data-base microshaft-data-base)

(define wheels (query '(wheel ?who)))

(test
 "redundant wheels"
 '((wheel (warbucks oliver)) (wheel (warbucks oliver)) (wheel (bitdiddle ben)) (wheel (warbucks oliver)) (wheel (warbucks oliver)))
 wheels
 'equal? equal?)

;; By the book's definition, Warbucks is a wheel four-times-over: one
;; for each sub-supervisee (Hacker, Fect, Tweakit and Cratchet).
