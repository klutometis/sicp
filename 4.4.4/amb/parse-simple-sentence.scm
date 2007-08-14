(define parse-simple-sentence
  '(define (parse-simple-sentence)
     (list 'simple-sentence
           (parse-noun-phrase)
           (parse-verb-phrase))))
