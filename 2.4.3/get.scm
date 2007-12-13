;;; Solutions copyright (C) 2007, Peter Danenberg; http://wizardbook.org
;;; Source code copyright (C) 1996, MIT; http://mitpress.mit.edu/sicp

;; Have to modify get to use equal?, not eq?, on values; since we'll
;; be comparing lists.
(define (get op type)
  (let* ((types (2d-get-alist-x op))
         (type-association (assoc type types))
         (ops (2d-get-alist-y type))
         (op-association (assoc op ops)))
    (if (pair? type-association)
        (cdr (assoc type types))
        (if (pair? op-association)
            (cdr (assoc op ops))
            false))))
