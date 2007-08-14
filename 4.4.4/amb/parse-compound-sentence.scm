(define parse-compound-sentence
  '(define (parse-compound-sentence)
     (list 'compound-sentence
           (parse-sentence)
           (parse-conjunction)
           (parse-sentence))))
