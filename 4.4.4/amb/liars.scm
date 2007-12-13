;;; Solutions copyright (C) 2007, Peter Danenberg; http://wizardbook.org
;;; Source code copyright (C) 1996, MIT; http://mitpress.mit.edu/sicp

(define liars
  '(define (liars)
     (let ((betty (amb 1 2 3 4 5))
           (kitty (amb 1 2 3 4 5)))
       (require (xor (= kitty 2) (= betty 3)))
       (let ((mary (amb 1 2 3 4 5)))
         (require (xor (= kitty 2) (= mary 4)))
         (require (xor (= mary 4) (= betty 1)))
         (let ((ethel (amb 1 2 3 4 5))
               (joan (amb 1 2 3 4 5)))
           (require (xor (= ethel 1) (= joan 2)))
           (require (distinct? (list betty kitty mary ethel joan)))
           (list (list 'betty betty)
                 (list 'kitty kitty)
                 (list 'mary mary)
                 (list 'ethel ethel)
                 (list 'joan joan)))))))
