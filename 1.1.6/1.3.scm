;;; Solutions copyright (C) 2007, Peter Danenberg; http://wizardbook.org
;;; Source code copyright (C) 1996, MIT; http://mitpress.mit.edu/sicp

(require-extension check)
(require '../util/util)
(import* util square)

;; Thanks, Joe Marshall;
;; <http://code.google.com/p/jrm-code-project/wiki/ProgrammingArt>.
;; See also <http://ircbrowse.com/channel/scheme/20070824>:
;; 
;; Riastradh: My favourite [solution] is recursive.  My
;; second-favourite uses no conditionals except for MIN and MAX, or
;; ABS if they are expanded to their definitions.
(define (sum-square-max x y z)
  (if (and (< x y) (< x z))
      (+ (square y) (square z))
      (sum-square-max y z x)))

(check (sum-square-max 1 2 3) => 13)
