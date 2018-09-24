#lang racket
(define (reverse l)
  (define (iter li acc)
    (if (null? li)
        acc
        (iter (cdr li) (cons (car li) acc))))
  (iter l null))
(reverse (list 1 2 3 4))