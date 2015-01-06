#!/usr/bin/env chicken-scheme

;; [[file:~/prg/sicp-klutometis/sicp.org::*%3Dxor%3D][=xor=:1]]

(define-syntax xor
  (ir-macro-transformer
   (lambda (expression inject compare)
     (let ((x (cadr expression))
           (y (caddr expression)))
       `(and (or ,x ,y)
             (not (and ,x ,y)))))))

;; =xor=:1 ends here
