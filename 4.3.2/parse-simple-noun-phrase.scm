(define parse-simple-noun-phrase
  '(define (parse-simple-noun-phrase)
     (list 'simple-noun-phrase
           (parse-word articles)
           (parse-word nouns))))
