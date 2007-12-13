;;; Solutions copyright (C) 2007, Peter Danenberg; http://wizardbook.org
;;; Source code copyright (C) 1996, MIT; http://mitpress.mit.edu/sicp

(define parse-simple-sentence
  '(define (parse-simple-sentence)
     (list 'simple-sentence
           (parse-noun-phrase)
           (parse-verb-phrase))))
