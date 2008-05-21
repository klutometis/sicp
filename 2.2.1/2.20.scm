;;; Solutions copyright (C) 2007, Peter Danenberg; http://wizardbook.org
;;; Source code copyright (C) 1996, MIT; http://mitpress.mit.edu/sicp

(require-extension check)

(define (same-parity integer . integers)
  (define predicate (if (even? integer) even? odd?))
  ;; decrementa -> decremenda; the things are about to be decremented,
  ;; though addressed as well, it's true.
  (define (iter predicate decremenda)
    ;; terminate list with null
    (cond ((null? decremenda) decremenda)
          ((predicate (car decremenda)) (cons (car decremenda) (iter predicate (cdr decremenda))))
          (else (iter predicate (cdr decremenda)))))
  (cons integer (iter predicate integers)))

(check (same-parity 1 2 3 4 5 6) => '(1 3 5))
