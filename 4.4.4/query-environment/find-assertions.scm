;;; Solutions copyright (C) 2007, Peter Danenberg; http://wizardbook.org
;;; Source code copyright (C) 1996, MIT; http://mitpress.mit.edu/sicp

(define (find-assertions pattern environment)
  (stream-flatmap (lambda (datum)
                    (check-an-assertion datum pattern environment))
                  (fetch-assertions pattern environment)))
