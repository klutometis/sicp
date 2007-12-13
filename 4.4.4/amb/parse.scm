;;; Solutions copyright (C) 2007, Peter Danenberg; http://wizardbook.org
;;; Source code copyright (C) 1996, MIT; http://mitpress.mit.edu/sicp

(define parse
  '(define (parse input)
     (set! *unparsed* input)
     (let ((sent (parse-sentence)))
       (require (null? *unparsed*))
       sent)))
