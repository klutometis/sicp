;;; Solutions copyright (C) 2007, Peter Danenberg; http://wizardbook.org
;;; Source code copyright (C) 1996, MIT; http://mitpress.mit.edu/sicp

;; In general, for a Huffman tree with weights 1, 2, 4, ..., 2^(n-1):
;; 1 bit is required to encode the most frequent symbol; n - 1, the
;; least frequent.

;; See 2.71-n=5.png and 2.71-n=10.png for the graphs of n = 5, n = 10;
;; respectively.
