(define parse-verb-phrase
  '(define (parse-verb-phrase)
     (define (maybe-extend verb-phrase)
       (amb verb-phrase
            (maybe-extend (list 'verb-phrase
                                verb-phrase
                                (parse-prepositional-phrase)))))
     (maybe-extend (parse-word verbs))))
