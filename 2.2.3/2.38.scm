;;; Solutions copyright (C) 2007, Peter Danenberg; http://wizardbook.org
;;; Source code copyright (C) 1996, MIT; http://mitpress.mit.edu/sicp

(require-extension syntax-case check)
(require '../2.2.3/section)
(import* section-2.2.3
         fold-right
         fold-left)

(let ((plicandum '(1 2 3)))
 (check (fold-right / 1 plicandum) => (/ 3 2))
 (check (fold-left / 1 plicandum) => (/ 1 6))
 (check (fold-right list '() plicandum) => '(1 (2 (3 ()))))
 (check (fold-left list '() plicandum) => '(((() 1) 2) 3))
 ;; Op should be commutative, such that
 ;; (equal? (fold-left op init seq) (fold-right op init seq))
 (check (fold-right + 0 plicandum)
        => (fold-left + 0 plicandum)))
