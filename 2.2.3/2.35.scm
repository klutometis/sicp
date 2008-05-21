;;; Solutions copyright (C) 2007, Peter Danenberg; http://wizardbook.org
;;; Source code copyright (C) 1996, MIT; http://mitpress.mit.edu/sicp

(require-extension syntax-case check)
(require '../2.2.3/section)
(import* section-2.2.3
         accumulate)

(define (enumerate-tree tree)
  (cond ((null? tree) '())
        ((not (pair? tree)) (list tree))
        (else (append (enumerate-tree (car tree))
                      (enumerate-tree (cdr tree))))))

;; Japanese solution
(define (count-leaves t)
  (accumulate + 0 (map (lambda (x) (if (pair? x) (count-leaves x) 1)) t)))

(let ((tree '(1 2 (3 4) ((5 6) 7))))
  (check (count-leaves tree) => 7))
