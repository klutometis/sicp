(define parse-word
  '(define (parse-word word-list)
     (require (not (null? *unparsed*)))
     (require (memq (car *unparsed*) (cdr word-list)))
     (let ((found-word (car *unparsed*)))
       (set! *unparsed* (cdr *unparsed*))
       (list (car word-list) found-word))))
