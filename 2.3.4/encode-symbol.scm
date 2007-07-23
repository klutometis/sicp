(load "left-branch.scm")
(load "right-branch.scm")
(load "symbols.scm")

(define (encode-symbol symbol tree)
  (define (encode code tree)            ; Assume that symbol is contained in root;
                                        ; catch later if not the case.
    (if (leaf? tree)
        code
        (let* ((left-tree (left-branch tree))
              (left-symbols (symbols left-tree))
              (right-tree (right-branch tree))
              (right-symbols (symbols right-tree)))
          (cond ((member symbol left-symbols)
                 (encode (append code '(0)) left-tree))
                ((member symbol right-symbols)
                 (encode (append code '(1)) right-tree))
                (else (error "bad symbol -- ENCODE-SYMBOL" symbol))))))
  (encode '() tree))
