;;; Solutions copyright (C) 2007, Peter Danenberg; http://wizardbook.org
;;; Source code copyright (C) 1996, MIT; http://mitpress.mit.edu/sicp

(load "decode.scm")
(load "encode.scm")
(load "sample-tree.scm")
(load "sample-message.scm")

(define original sample-message)
(define tree sample-tree)
(define decoded-original (decode original sample-tree))
(define reencoded-original (encode decoded-original sample-tree))
(equal? reencoded-original original)
