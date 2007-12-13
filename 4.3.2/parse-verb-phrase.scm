;;; Solutions copyright (C) 2007, Peter Danenberg; http://wizardbook.org
;;; Source code copyright (C) 1996, MIT; http://mitpress.mit.edu/sicp

(define parse-verb-phrase
  '(define (parse-verb-phrase)
     (define (maybe-extend verb-phrase)
       (amb verb-phrase
            (maybe-extend (list 'verb-phrase
                                verb-phrase
                                (parse-prepositional-phrase)))))
     (maybe-extend (parse-word verbs))))
