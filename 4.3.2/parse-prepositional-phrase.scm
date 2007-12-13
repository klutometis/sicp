;;; Solutions copyright (C) 2007, Peter Danenberg; http://wizardbook.org
;;; Source code copyright (C) 1996, MIT; http://mitpress.mit.edu/sicp

(define parse-prepositional-phrase
  '(define (parse-prepositional-phrase)
     (list 'prep-phrase
           (parse-word prepositions)
           (parse-noun-phrase))))
