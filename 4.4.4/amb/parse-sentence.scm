(define parse-sentence
  '(define (parse-sentence)
     (define (maybe-extend sentence)
       (amb sentence
            (maybe-extend (list 'compound-sentence
                                sentence
                                (parse-conjunction)))))
     (maybe-extend (parse-simple-sentence))))
