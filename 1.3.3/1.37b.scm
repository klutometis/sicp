;;; Solutions copyright (C) 2007, Peter Danenberg; http://wizardbook.org
;;; Source code copyright (C) 1996, MIT; http://mitpress.mit.edu/sicp

(require-extension syntax-case check)
(require '../1.3.3/section)
(require '../util/util)
(import* util phi)
(import* section-1.3.3 cont-frac-iter test-cont-frac)

(check
 (cont-frac-iter (lambda (i) 1.0)
                 (lambda (i) 1.0)
                 100)
 => (/ 1 phi))

(check (test-cont-frac
        (lambda (i) 1.0)
        (lambda (i) 1.0)
        0.00001
        cont-frac-iter)
       => 13)
