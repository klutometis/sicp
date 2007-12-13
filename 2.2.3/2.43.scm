;;; Solutions copyright (C) 2007, Peter Danenberg; http://wizardbook.org
;;; Source code copyright (C) 1996, MIT; http://mitpress.mit.edu/sicp

(load "queens.scm")

;; Pathological flatmap (cf. 2.42)
;;
;; Whereas 2.42 requires n + 1 calls to queen-cols
;; (one for each row and one for the base case),
;; 2.43 does an entire search of a full n-ary tree
;; of height n (where n = board-size).  It therefore
;; calls queen-cols (n ^ (n + 1) - 1) / (n - 1) times.
;;
;; Calls to safe? are difficult to predict a priori,
;; but increase roughly linearly and exponentially,
;; respectively.
;;
;; If 2.42 solves the n = 8 problem in time T, we might
;; expect 2.43 to do so in:
;;
;;           n ^ (n + 1)
;;         --------------- * T
;;         (n - 1) (n + 1)
;;
;; or about 2 * 10 ^ 6 T.
(define (queens board-size)
  (define (queen-cols k)
    (if (= k 0)
        (list empty-board)
        (filter
         (lambda (positions) (safe? k positions))
           (flatmap
            (lambda (new-row)
              (map (lambda (rest-of-queens)
                     (adjoin-position new-row k rest-of-queens))
                   (queen-cols (- k 1))))
            (enumerate-interval 1 board-size)))))
  (queen-cols board-size))

(queens 4)
