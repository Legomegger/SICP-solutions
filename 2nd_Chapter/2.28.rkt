#lang racket
(define (fridge x)
  (cond ((null? x) (list))
        ((not (pair? x)) (list x))
        (else (append (fridge (car x))
                      (fridge (cdr x))))))
(list (list 1 2) (list 3 4))
(fridge (list (list 1 2) (list 3 4)))
(fridge (list))
(fridge (list 1))

       