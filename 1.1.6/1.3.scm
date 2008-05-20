;;; Solutions copyright (C) 2007, Peter Danenberg; http://wizardbook.org
;;; Source code copyright (C) 1996, MIT; http://mitpress.mit.edu/sicp

(require-extension check)

;; Thanks, Joe Marshall;
;; <http://code.google.com/p/jrm-code-project/wiki/ProgrammingArt>.
;; See also <http://ircbrowse.com/channel/scheme/20070824>:
;; 
;; Riastradh: My favourite [solution] is recursive.  My
;; second-favourite uses no conditionals except for MIN and MAX, or
;; ABS if they are expanded to their definitions.
(define (square x) (* x x))
(define (sum-square x y) (+ (square x) (square y)))
(define (sum-square-max x y z)
  (if (and (< x y) (< x z))
      (sum-square y z)
      (sum-square-max y z x)))

(check (sum-square-max 1 2 3) => 13)
