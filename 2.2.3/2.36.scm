;;; Solutions copyright (C) 2007, Peter Danenberg; http://wizardbook.org
;;; Source code copyright (C) 1996, MIT; http://mitpress.mit.edu/sicp

(require-extension syntax-case check)
(require '../2.2.3/section)
(import* section-2.2.3 accumulate-n)

(let ((seqs '((1 2 3) (4 5 6) (7 8 9) (10 11 12))))
  (check (accumulate-n + 0 seqs)
         => '(22 26 30)))
