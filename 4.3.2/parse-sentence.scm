(define parse-sentence
  '(define (parse-sentence)
     (list 'sentence
           (parse-noun-phrase)
           (parse-verb-phrase))))
