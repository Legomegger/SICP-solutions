#lang sicp
(define (reverse list)
  (define (list-iter l result)
    (if (null? l)
        result
        (list-iter (cdr l)
                   (cons (car l) result))))
  (list-iter list nil))

(define a (list 1 2 3 4))
(reverse a)