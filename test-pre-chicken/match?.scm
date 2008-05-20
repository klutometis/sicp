;;; Solutions copyright (C) 2007, Peter Danenberg; http://wizardbook.org
;;; Source code copyright (C) 1996, MIT; http://mitpress.mit.edu/sicp

(load-option 'format)
(load-option 'regular-expression)

(define (match? pattern result)
  (not (false? (re-string-match pattern (format #f "~A" result)))))
