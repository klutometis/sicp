(load "generate-huffman-tree.scm")
(load "encode.scm")

;;(define pairs '((A 4) (B 2) (C 1) (D 1)))
(define pairs '((a 8) (b 3) (c 1) (d 1) (e 1) (f 1) (g 1) (h 1)))
(define tree (generate-huffman-tree pairs))
(define message '(b a c a d a e a f a b b a a a g a h))
message
(trace encode)
(encode message tree)
