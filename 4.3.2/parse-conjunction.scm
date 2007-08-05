(define parse-conjunction
  '(define (parse-conjunction)
    (list 'conjunction
          (parse-word conjunctions)
          (parse-sentence))))
