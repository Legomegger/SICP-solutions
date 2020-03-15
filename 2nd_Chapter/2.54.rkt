#lang racket
(equal? '(this is a list) '(this is a list))
(equal? '(this is a list) '(this (is a) list))

(define (equa? a b)
  (cond ((or (and (and (not (pair? a)) (not (pair? b))) (eq? a b))
             (and (and (pair? a) (pair? b)) (cons (equa? (car a) (car b))
                                                  (equa? (cdr a) (cdr b))))))
        (else #f)))

(equa? '(a) '(a))
 