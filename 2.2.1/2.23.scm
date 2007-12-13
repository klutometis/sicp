;;; Solutions copyright (C) 2007, Peter Danenberg; http://wizardbook.org
;;; Source code copyright (C) 1996, MIT; http://mitpress.mit.edu/sicp

(define (for-each applicans applicanda)
  (if (null? applicanda)
      ;; Unspecified return value
      (newline)
      (begin (applicans (car applicanda))
             (for-each applicans (cdr applicanda)))))

(for-each (lambda (x) (newline) (display x))
          (list 58 234 342))
