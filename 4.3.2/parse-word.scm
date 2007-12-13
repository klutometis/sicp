;;; Solutions copyright (C) 2007, Peter Danenberg; http://wizardbook.org
;;; Source code copyright (C) 1996, MIT; http://mitpress.mit.edu/sicp

(define parse-word
  '(define (parse-word word-list)
     (require (not (null? *unparsed*)))
     (require (memq (car *unparsed*) (cdr word-list)))
     (let ((found-word (car *unparsed*)))
       (set! *unparsed* (cdr *unparsed*))
       (list (car word-list) found-word))))
