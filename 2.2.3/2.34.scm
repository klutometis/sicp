;;; Solutions copyright (C) 2007, Peter Danenberg; http://wizardbook.org
;;; Source code copyright (C) 1996, MIT; http://mitpress.mit.edu/sicp

(require-extension syntax-case check)
(require '../2.2.3/section)
(import* section-2.2.3
         accumulate)

;;; Thanks, Jeff Zohrab
;;; <http://community.schemewiki.org/?sicp-ex-2.34>.
(define (horner-eval x coefficient-sequence)
  (accumulate ;;accumulator
   (lambda (this-coeff higher-terms)
     (+ this-coeff (* x higher-terms)))
   0
   coefficient-sequence))

(check (horner-eval 2 '(1 3 0 5 0 1)) => 79)
