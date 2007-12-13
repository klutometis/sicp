;;; Solutions copyright (C) 2007, Peter Danenberg; http://wizardbook.org
;;; Source code copyright (C) 1996, MIT; http://mitpress.mit.edu/sicp

;; See 3.11{a,b,c}.dot

;; Local state for acc is kept in E1, along with pointers to the
;; internal definitions; state for acc2 is kept in a new environment
;; with local variable `amount', and new pointers to the old functions
;; `withdraw', `deposit', `dispatch'.
