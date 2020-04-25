#lang sicp
(define (deep-reverse list)
  (define (list-iter l result)
    (cond ((null? l) result)
          ((not (pair? l)) l)
          (else (list-iter (cdr l) (cons (list-iter (car l) nil) result)))))
  (list-iter list nil))

(define x (list (list 1 2) (list 3 4)))
(deep-reverse x)


      
