;;; Solutions copyright (C) 2007, Peter Danenberg; http://wizardbook.org
;;; Source code copyright (C) 1996, MIT; http://mitpress.mit.edu/sicp

(require-extension syntax-case check)
(require '../2.2.3/section)
(import* section-2.2.3
         fold-right
         fold-left)

(define (reverse-right reversandum)
  (fold-right (lambda (x y) (append y (list x))) '() reversandum))

(define (reverse-left reversandum)
  (fold-left (lambda (x y) (cons y x)) '() reversandum))

(let ((reversandum '(1 2 3)))
 (let ((reversatum-right (reverse-right reversandum))
       (reversatum-left (reverse-left reversandum)))
   (check reversatum-left => '(3 2 1))
   (check reversatum-right => reversatum-left)))
