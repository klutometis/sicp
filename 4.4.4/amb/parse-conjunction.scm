;;; Solutions copyright (C) 2007, Peter Danenberg; http://wizardbook.org
;;; Source code copyright (C) 1996, MIT; http://mitpress.mit.edu/sicp

(define parse-conjunction
  '(define (parse-conjunction)
    (list 'conjunction
          (parse-word conjunctions)
          (parse-sentence))))
