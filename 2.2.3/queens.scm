;;; Solutions copyright (C) 2007, Peter Danenberg; http://wizardbook.org
;;; Source code copyright (C) 1996, MIT; http://mitpress.mit.edu/sicp

(define (queens board-size)
  (define (queen-cols k)
    (if (= k 0)
        (list empty-board)
        (filter
         (lambda (positions) (safe? k positions))
         (flatmap
          (lambda (rest-of-queens)
            (map (lambda (new-row)
                   (adjoin-position new-row k rest-of-queens))
                 (enumerate-interval 1 board-size)))
         (queen-cols (- k 1))))))
  (queen-cols board-size))

(define (safe? k positions)
  (define (collision? collidendum k collidentia)
    (if (null? collidentia)
        #f
        (let ((collidens (car collidentia))
              (n-collidentia (length collidentia)))
          (cond ((= collidendum collidens) #t)
                ((= (- k n-collidentia) (abs (- collidendum collidens))) #t)
                (else (collision? collidendum k (cdr collidentia)))))))
  (not (collision? (car positions) k (cdr positions))))

(define empty-board '())

(define (adjoin-position new-row k rest-of-queens)
  (cons new-row rest-of-queens))
