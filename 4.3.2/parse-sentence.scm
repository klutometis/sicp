;;; Solutions copyright (C) 2007, Peter Danenberg; http://wizardbook.org
;;; Source code copyright (C) 1996, MIT; http://mitpress.mit.edu/sicp

(define parse-sentence
  '(define (parse-sentence)
     (define (maybe-extend sentence)
       (amb sentence
            (maybe-extend (list 'compound-sentence
                                sentence
                                (parse-conjunction)))))
     (maybe-extend (parse-simple-sentence))))
