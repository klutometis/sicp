#!/usr/bin/env chicken-scheme

(define (make-simultaneous-scope variables values body)
  (let ((gensyms (list-tabulate (length variables) (lambda (i) (gensym)))))
    (let ((variable-bindings
           (map (lambda (variable) `(,variable '*unassigned*)) variables))
          (gensym-bindings
           (map (lambda (gensym value) `(,gensym ,value)) gensyms values))
          (sets!
           (map (lambda (variable gensym) `(set! ,variable ,gensym)) variables gensyms)))
      `(let ,variable-bindings (let ,gensym-bindings ,@sets!) ,@body))))
