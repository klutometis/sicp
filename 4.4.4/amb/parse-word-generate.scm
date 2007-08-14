(define parse-word-generate
  '(define (parse-word word-list)
     (let ((found-word (an-element-of (cdr word-list))))
       (require (not (null? *unparsed*)))
       (set! *unparsed* (cdr *unparsed*))
       (list (car word-list) found-word))))
