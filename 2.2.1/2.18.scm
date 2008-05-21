;;; Solutions copyright (C) 2007, Peter Danenberg; http://wizardbook.org
;;; Source code copyright (C) 1996, MIT; http://mitpress.mit.edu/sicp

(require-extension syntax-case check)
(require '../2.2.1/section)
(import* section-2.2.1 reverse)

(let* ((orthogonal '(1 2 3 4))
       (reversal (reverse orthogonal))
       (reverse-reversal (reverse reversal)))
  (check reversal => '(4 3 2 1))
  (check reverse-reversal => orthogonal))
