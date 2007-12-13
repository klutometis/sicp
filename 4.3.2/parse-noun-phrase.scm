;;; Solutions copyright (C) 2007, Peter Danenberg; http://wizardbook.org
;;; Source code copyright (C) 1996, MIT; http://mitpress.mit.edu/sicp

(define parse-noun-phrase
  '(define (parse-noun-phrase)
     (define (maybe-extend noun-phrase)
       (amb noun-phrase
            (maybe-extend (list 'noun-phrase
                                noun-phrase
                                (parse-prepositional-phrase)))))
     (maybe-extend (parse-simple-noun-phrase))))
